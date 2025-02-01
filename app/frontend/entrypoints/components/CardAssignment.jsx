import React from 'react';

const CardAssignment = ({ project, availableObjects, handleSelection, kind }) => {
  console.log("project", project)
  console.log("availableObjects", availableObjects)
  return (
    <div key={project.id} className="border p-4 rounded-lg shadow-md">
      <h3 className="text-xl font-semibold">{project.name}</h3>
      <p>Start: {project.start_date}</p>
      <p>Duration: {project.duration}</p>

      <div className="mt-4">
        <h4 className="font-medium">{kind}</h4>
        <div className="flex flex-wrap gap-2 overflow-auto max-w-full">
          {availableObjects?.map((userOrTask) => (
            <div key={userOrTask.id} className="flex items-center m-1">
              <div className="flex items-center justify-between p-2 rounded-lg shadow-sm bg-white">
                <span className="text-gray-800">{userOrTask.id} | {userOrTask.name}&nbsp;</span>
                <button
                  className="cursor-pointer px-2 py-1 text-sm text-white bg-blue-500 rounded hover:bg-blue-600"
                  onClick={(e) => handleSelection(e, userOrTask, project)}
                >
                  Add
                </button>
              </div>
            </div>
          ))}
        </div>
      </div>

      <div className="mt-4">
        <h4 className="font-medium">Assigned {kind}</h4>
        <ul className="flex flex-wrap gap-2 overflow-auto max-w-full">
          {project[`assigned_${kind.toLowerCase()}`].map((userOrTask) => (
            <div key={userOrTask.id} className="flex m-1 items-center justify-between p-2 rounded-lg shadow-sm bg-white">
              <span className="text-gray-800">{userOrTask.id} | {userOrTask.name}&nbsp;</span>
              <button
                className="cursor-pointer px-2 py-1 text-sm text-white bg-pink-500 rounded hover:bg-pink-600"
                onClick={(e) => handleSelection(e, userOrTask, project)}
              >Remove
              </button>
            </div>
          ))}
        </ul>
      </div>

    </div>
  );
};

export default CardAssignment;
