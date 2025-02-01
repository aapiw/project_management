// Project.jsx
import React, { useState, useEffect } from "react";
import { useAuth } from "../context/AuthContext"; // Assuming you have this context for user
import { fetchProjects, fetchTasks, assignTaskToProject, unassignTaskToProject, assignUserToProject, unassignUserFromProject } from "../api/api"; // Importing API functions
import CardAssignment from "./CardAssignment"; // Importing CardAssignment component

const Project = () => {
  const { currentUser } = useAuth(); // Get user from context
  const [projects, setProjects] = useState([]);
  // const [users, setUsers] = useState([]);
  // const [availableUsers, setAvailableUsers] = useState([]);
  // const [availableTasks, setAvailableTasks] = useState([]);
  const [tasks, setTasks] = useState([]);
  const [error, setError] = useState(null);

  // Fetch data function
  const fetchData = async () => {
    try {
      const projectsResponse = await fetchProjects(currentUser);

      let usersResponse = [];
      let tasksResponse = [];

      if (currentUser.role === "admin") {
        // usersResponse = await fetchUsers(currentUser);
      } else if (currentUser.role === "user") {
        tasksResponse = await fetchTasks(currentUser);
      }

      setProjects(projectsResponse);
      setTasks(tasksResponse);
    } catch (err) {
      setError("Error fetching data.");
      console.error(err);
    }
  };

  useEffect(() => {
    if (currentUser) fetchData();
  }, [currentUser]);

  const handleUserSelection = async (event, user, project) => {
  const add = event.target.textContent === "Add"; // Fixing the destructuring issue
  setProjects((prevProjects) =>
    prevProjects.map((p) =>
      p.id === project.id
        ? {
            ...p,
            available_users: add
              ? p.available_users.filter((u) => u.id !== user.id) // Remove from available_users
              : [...new Set([...p.available_users, { id: user.id, name: user.name }])], // Ensure uniqueness
            assigned_users: add
              ? [...new Set([...p.assigned_users, { id: user.id, name: user.name }])] // Ensure uniqueness
              : p.assigned_users.filter((u) => u.id !== user.id),
          }
        : p
    )
  );

  try {
    if (add) {
      await assignUserToProject(project.id, user.id, currentUser);
    } else {
      await unassignUserFromProject(project.id, user.id, currentUser);
    }
  } catch (err) {
    alert(`Error ${add ? "assigning" : "unassigning"} user.`);
    console.error(err);
  }
};

  const handleTaskSelection = async (event, task, project) => {
    const add = event.target.textContent === "Add"; // Fixing the destructuring issue
    try {
      if (add) {
        await assignTaskToProject(project.id, task.id, currentUser); // Pass user to API function
      } else {
        await unassignTaskToProject(project.id, task.id, currentUser); // Pass user to API function
      }
      
      setProjects((prevProjects) =>
        prevProjects.map((p) =>
          p.id === project.id
            ? {
              ...p,
              assigned_tasks: add
                ? [...new Set([...p.assigned_tasks, { id: task.id, name: task.name }])] // Ensure uniqueness
                : p.assigned_tasks.filter((t) => t.id !== task.id),
            }
            : p
        )
      );
      setTasks((prevTasks) => {
        // if (!prevTasks || !Array.isArray(prevTasks.available_tasks)) {
        //   return prevTasks; // Ensure the structure exists
        // }

        return {
          ...prevTasks,
          available_tasks: add
            ? prevTasks.available_tasks.filter((t) => t.id !== task.id) // Remove from available_tasks
            : [...prevTasks.available_tasks, task], // Add back to available_tasks
        };
      });

    } catch (err) {
      alert(`Error ${add ? "assigning" : "unassigning"} task.`);
      console.error(err);
    }
  };
  return (
    <div className="p-6 space-y-6">
      <h2 className="text-3xl font-semibold">Active Projects ({projects.length})</h2>
      {error && <p className="text-red-500">{error}</p>}

      {projects.length === 0 ? (
        <p>No active projects found.</p>
      ) : (
          <div className="space-y-4">
            {projects.map((project) => {
              if (currentUser.role === "admin") {
                return (
                  <CardAssignment
                    key={project.id}
                    project={project}
                    availableObjects={project.available_users}
                    handleSelection={handleUserSelection}
                    kind={"Users"}
                  />
                );
              } else {
                return (
                  <CardAssignment
                    key={project.id}
                    project={project}
                    availableObjects={tasks.available_tasks}
                    handleSelection={handleTaskSelection}
                    kind={"Tasks"}
                  />
                );
              }
            })}
          </div>
      )}
    </div>
  );
};

export default Project;
