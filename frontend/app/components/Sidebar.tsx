import React from "react";
import styles from "./Sidebar.module.css";
import UserProfile from "./User";

interface SidebarProps {
  showSidebar: boolean;
  onCloseSidebar: () => void;
}

const Sidebar: React.FC<SidebarProps> = ({ showSidebar, onCloseSidebar }) => {
  return (
    <div className={`${styles.sidebar} ${showSidebar ? styles.open : ""}`}>
      <div className={styles.header}>
        <button className={styles.closeButton} onClick={onCloseSidebar}>
          ☰
        </button>
      </div>
      <div className={styles.content}>
        <UserProfile />
      </div>
    </div>
  );
};

export default Sidebar;
