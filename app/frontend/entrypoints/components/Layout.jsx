import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from "../context/AuthContext";

const Layout = ({ children }) => {
  const { currentUser, loading, logout } = useAuth();
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);

  if (loading) return <p>Loading...</p>;

  const toggleSidebar = () => setIsSidebarOpen(prev => !prev);
  const toggleDropdown = () => setIsDropdownOpen(prev => !prev);

  const handleLogout = () => {
    logout();
    setIsDropdownOpen(false);
  };
// console.log("currentUser", currentUser)
  return (
    <div className="flex h-screen overflow-hidden">
      {/* Sidebar */}
      <div className={`${isSidebarOpen ? 'block' : 'hidden'} lg:block w-64 bg-gray-800 text-white p-5 transition-all duration-300 ease-in-out`}>
        <h2 className="text-2xl font-bold mb-4">Project Management</h2>
        <ul>
          {currentUser && (
            <>
              <li><Link to="/" className="text-white">Home</Link></li>
              <li className="mb-2"><Link to="projects" className="text-white">Projects</Link></li>
            </>
          )}
          <li>
            {currentUser ? (
              <button onClick={handleLogout} className="text-white cursor-pointer">Logout</button>
            ) : (
              <Link to="login" className="text-white">Login</Link>
            )}
          </li>
        </ul>
      </div>

      {/* Main Content */}
      <div className="flex-1 flex flex-col">
        {/* Header */}
        <header className="bg-gray-800 text-white p-4 flex items-center justify-between">
          <button
            onClick={toggleSidebar}
            className="lg:hidden text-white"
            aria-label="Toggle Sidebar"
          >
            <span className="text-lg font-semibold">☰</span>
          </button>

          <h1 className="text-2xl">{currentUser && `Welcome ${currentUser.name}`}</h1>

          {/* Dropdown Menu */}
          <div className="relative">
            {currentUser && `Role: ${currentUser.role}`}
            {isDropdownOpen && (
              <div className="absolute right-0 mt-2 w-48 bg-white border rounded-lg shadow-lg">
                <ul className="p-2">
                  <li className="mb-2">
                    <button
                      className="text-gray-800 hover:text-gray-600 w-full text-left"
                      onClick={handleLogout}
                    >
                      Logout
                    </button>
                  </li>
                </ul>
              </div>
            )}
          </div>
        </header>

        {/* Main Content */}
        <main className="flex-1 p-6 overflow-auto">{children}</main>
      </div>
    </div>
  );
};

export default Layout;