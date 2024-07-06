"use client";

import React, { useCallback, useState } from "react";
import PostForm from "./components/PostForm";
import PostList from "./components/PostList";

const Home: React.FC = () => {
  const handlePostCreated = useCallback(() => {
    document.dispatchEvent(new Event("postCreated"));
  }, []);

  return (
    <div>
      <PostForm onPostCreated={handlePostCreated} />
      <PostList />
    </div>
  );
};

export default Home;
