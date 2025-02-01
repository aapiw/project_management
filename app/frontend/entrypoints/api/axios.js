// src/api/axios.js
import axios from 'axios';

const axiosInstance = axios.create({
  baseURL: 'http://localhost:3000/api/v1.0.0',  // Replace with your API's base URL
  withCredentials: true, // Ensures cookies are sent if using sessions
  headers: {
    'Content-Type': 'application/json',
    
    // 'Authorization': 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3NDA3MzI2MzB9.RUMWUA_58KoUUIySvDNlWSqCcobc6pesIFTp33vT8O0'
    // Add more headers here if needed, like Authorization tokens
  },
});

export default axiosInstance;
