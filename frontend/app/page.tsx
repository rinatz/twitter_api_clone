"use client";

import React, { useCallback, useState } from "react";
import PostForm from "./components/PostForm";
import PostList from "./components/PostList";
import Sidebar from "./components/Sidebar";
import styles from "./page.module.css";

const Home: React.FC = () => {
  const [showSidebar, setShowSidebar] = useState(true);

  const handleToggleSidebar = () => {
    setShowSidebar(!showSidebar);
  };

  const handlePostCreated = useCallback(() => {
    document.dispatchEvent(new Event("postCreated"));
  }, []);

  return (
    <div className={styles.container}>
      <Sidebar showSidebar={showSidebar} onCloseSidebar={handleToggleSidebar} />
      <div className={styles.content}>
        {!showSidebar && (
          <button
            className={styles.sidebarToggle}
            onClick={handleToggleSidebar}
          >
            ☰
          </button>
        )}
        <PostForm onPostCreated={handlePostCreated} />
        <PostList />
      </div>
    </div>
  );
};

export default Home;
