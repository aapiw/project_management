
import React, { useState } from 'react';
import { Link } from 'react-router-dom';

const Layout = ({ children }) => {
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);

  const toggleSidebar = () => {
    setIsSidebarOpen(!isSidebarOpen);
  };

  const toggleDropdown = () => {
    setIsDropdownOpen(!isDropdownOpen);
  };

  return (
    <div className="flex h-screen overflow-hidden">
      {/* Sidebar */}
      <div
        className={`${isSidebarOpen ? 'block' : 'hidden'
          } lg:block w-64 bg-gray-800 text-white p-5 transition-all duration-300 ease-in-out`}
      >
        <h2 className="text-2xl font-bold mb-4">Project Management</h2>
        <ul>
          <li className="mb-2">
            <Link to="projects" className="text-white">Project</Link>
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
            {/* Hamburger button (no icon, just text) */}
            <span className="text-lg font-semibold">☰</span> {/* Text-based Hamburger */}
          </button>
          <h1 className="text-2xl">Welcome</h1>

          {/* Dropdown Menu */}
          <div className="relative">
            <button
              onClick={toggleDropdown}
              className="text-white flex items-center"
            >
              <span className="mr-2">Profile</span>
              <span>▼</span> {/* Dropdown text */}
            </button>

            {isDropdownOpen && (
              <div className="absolute right-0 mt-2 w-48 bg-white border rounded-lg shadow-lg">
                <ul className="p-2">
                  <li className="mb-2">
                    <button
                      className="text-gray-800 hover:text-gray-600 w-full text-left"
                      onClick={() => alert('Logged out')}
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
