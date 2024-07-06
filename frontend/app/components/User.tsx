import React, { useEffect, useState } from "react";
import styles from "./UserProfile.module.css";

interface User {
  id: number;
  name: string;
  created_at: string;
  updated_at: string;
}

const UserProfile: React.FC = () => {
  const [user, setUser] = useState<User | null>(null);

  const fetchUser = async () => {
    const response = await fetch("http://localhost:3000/users/1");

    if (response.ok) {
      const data: User = await response.json();
      setUser(data);
    }
  };

  useEffect(() => {
    fetchUser();
  }, []);

  return (
    <div className={styles.userProfile}>
      <h2 className={styles.userName}>{user?.name}</h2>
    </div>
  );
};

export default UserProfile;
