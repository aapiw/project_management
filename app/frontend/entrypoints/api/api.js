import axiosInstance from "./axios";

const apiRequest = async (method, url, data = null, token = null) => {
  try {
    const response = await axiosInstance({
      method,
      url,
      data,
      headers: {
        'Authorization': token,
      },
    });
    return response.data?.data || response.data;
  } catch (error) {
    console.error(`API Error (${method.toUpperCase()} ${url}):`, error);
    throw error;
  }
};

export const fetchProjects = (currentUser) => {
  const url = currentUser?.role === 'admin' ? '/admin/projects?active=true' : '/user/projects';
  return apiRequest('get', url, null, currentUser?.token);
};

// export const fetchUsers = (currentUser) => {
//   return apiRequest('get', '/admin/users', null, currentUser?.token);
// };

export const assignUserToProject = (projectId, userId, currentUser) =>{
  apiRequest("post", `/admin/projects/${projectId}/assign_users`, { user_ids: [userId] }, currentUser?.token)
};

export const unassignUserFromProject = (projectId, userId, currentUser) =>
  apiRequest("post", `/admin/projects/${projectId}/unassign_users`, { user_ids: [userId] }, currentUser?.token);

export const fetchTasks = (currentUser) => {
  const url = '/user/tasks'
  return apiRequest('get', url, null, currentUser?.token);
};

export const assignTaskToProject = (projectId, taskId, currentUser) =>{
  apiRequest("post", `/user/projects/${projectId}/assign_tasks`, { task_ids: [taskId] }, currentUser?.token)
};

export const unassignTaskToProject = (projectId, taskId, currentUser) =>{
  apiRequest("post", `/user/projects/${projectId}/unassign_tasks`, { task_ids: [taskId] }, currentUser?.token)
};