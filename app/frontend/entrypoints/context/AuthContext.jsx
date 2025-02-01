import React, { createContext, useState, useEffect, useContext } from "react";
import axiosInstance from "../api/axios";

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [currentUser, setCurrentUser] = useState(null);
  const [loading, setLoading] = useState(true);

  // Fetch user from localStorage on app load
  useEffect(() => {
    const storedUser = localStorage.getItem("user");

    if (storedUser) {
      setCurrentUser(JSON.parse(storedUser)); // Set user from localStorage
    }

    setLoading(false); // Stop loading after checking
  }, []);

  const login = async (credentials) => {
    try {
      const response = await axiosInstance.post("/auth/login", credentials);
      const user = response.data;

      // Save user to localStorage
      localStorage.setItem("user", JSON.stringify(user));

      // Set user in state
      setCurrentUser(user);
      return response.data;
    } catch (error) {
      console.error("Login error:", error.response?.data || error);
      throw error;
    }
  };

  const logout = async () => {
    try {
      // Clear user data from localStorage
      localStorage.removeItem("user");

      // Set user to null in state
      setCurrentUser(null);
    } catch (error) {
      console.error("Logout error:", error);
    }
  };

  return (
    <AuthContext.Provider value={{ currentUser, loading, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  return useContext(AuthContext);
};

export default AuthContext;
