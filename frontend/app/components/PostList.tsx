import React, { useEffect, useState } from "react";
import styles from "./PostList.module.css";

interface Post {
  id: number;
  content: string;
  user_id: number;
  created_at: string;
  updated_at: string;
}

const PostList: React.FC = () => {
  const [posts, setPosts] = useState<Post[]>([]);

  const fetchPosts = async () => {
    const response = await fetch("http://localhost:3000/users/1/posts");
    const data: Post[] = await response.json();
    setPosts(data);
  };

  useEffect(() => {
    fetchPosts();
    const handlePostCreated = () => fetchPosts();
    document.addEventListener("postCreated", handlePostCreated);
    return () => document.removeEventListener("postCreated", handlePostCreated);
  }, []);

  return (
    <div className={styles.postList}>
      <ul className={styles.list}>
        {posts
          .slice()
          .reverse()
          .map((post, index) => (
            <li key={index} className={styles.listItem}>
              <p>{post.content}</p>
              <small>{new Date(post.created_at).toLocaleString()}</small>
            </li>
          ))}
      </ul>
    </div>
  );
};

export default PostList;
