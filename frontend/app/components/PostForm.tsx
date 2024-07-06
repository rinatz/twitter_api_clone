import React, { useState } from "react";
import styles from "./PostForm.module.css";

interface PostFormProps {
  onPostCreated: () => void;
}

const PostForm: React.FC<PostFormProps> = ({ onPostCreated }) => {
  const [text, setText] = useState("");

  const handleSubmit = async (event: React.FormEvent) => {
    event.preventDefault();

    if (text.trim() === "") {
      return;
    }

    const response = await fetch("http://localhost:3000/users/1/posts", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ content: text }),
    });

    if (response.ok) {
      setText("");
      onPostCreated();
    }
  };

  return (
    <form onSubmit={handleSubmit} className={styles.form}>
      <div className={styles.formGroup}>
        <textarea
          id="postContent"
          name="postContent"
          value={text}
          onChange={(e) => setText(e.target.value)}
          rows={5}
          cols={33}
          placeholder="いまどうしてる？"
          className={styles.textarea}
        />
      </div>

      <button
        type="submit"
        disabled={text.trim() === ""}
        className={styles.button}
      >
        ポストする
      </button>
    </form>
  );
};

export default PostForm;
