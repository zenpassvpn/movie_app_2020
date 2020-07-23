import React from 'react';

function Food({ fav, imagesrc }) {
  return (
    <div>
      <h1> {fav}를 좋아해요</h1>
      <img key={fav} src={imagesrc} alt={fav} />
    </div>
  );
}

const foodILike = [
  {
    id: 1,
    name: ' 김치',
    imagesrc: 'http://img.danawa.com/prod_img/500000/830/590/img/5590830_1.jpg',
  },
  {
    id: 2,
    name: ' 수박',
    imagesrc: 'http://www.hadong.go.kr/_res/center/img/sub/web02154_img11.jpg',
  },

  {
    id: 3,
    name: ' 당근',
    imagesrc:
      'https://images.mypetlife.co.kr/content/uploads/2019/07/17103705/carrots-close-up-orange-37641.jpg',
  },

  {
    id: 4,
    name: '꽃등심',
    imagesrc:
      'https://cdn.crowdpic.net/detail-thumb/thumb_d_1A8D44C1F255AE88C080837FB416D474.jpg',
  },
];

function App() {
  return (
    <div>
      {foodILike.map((food) => (
        <Food key={food.id} fav={food.name} imagesrc={food.imagesrc} />
      ))}
    </div>
  );
}

export default App;
