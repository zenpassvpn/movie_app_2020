import React from 'react';

function Food({ fav }) {
  return <h1> {fav}를 좋아해요</h1>;
}

function App() {
  return (
    <div>
      <Food fav="김치" />
      <Food fav="고양이" />
      <Food fav="강아지" />
    </div>
  );
}

export default App;
