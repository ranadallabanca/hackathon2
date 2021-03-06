import axios from "axios";
import React, { useEffect, useState } from "react";
import { Button, Card, Form } from "semantic-ui-react";

const TeamForm = ({ addTeam }) => {
  const [name, setName] = useState([]);

  

  const handleSubmit = (e) => {
    console.log("Submit clicked");
    addTeam({ name: name });
  };

  return (
    <>
      <div>
        <h2>Team Form</h2>
      </div>
      <div>
        <Form onSubmit={handleSubmit}>
          <Form.Input
            placeholder="Team Name"
            name="name"
            value={name}
            onChange={(e) => {
              setName(e.target.value);
            }}
          />
          <Button>+</Button>
        </Form>
      </div>
    </>
  );
};

export default TeamForm;
