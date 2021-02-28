const token = document.querySelector("meta[name='csrf-token']").content;
const headers = { "Content-Type": "application/json", "X-CSRF-Token": token };



document.addEventListener('DOMContentLoaded', ()=> {
  document.querySelectorAll('.action .btn_solicitar').forEach(button => {
    button.addEventListener('click', requested_friend);
  });

  document.querySelectorAll('.action .btn_social').forEach(button => {
    button.addEventListener('click', updated_friend);
  })

});

const requested_friend = event => {
  console.log('acionado com sucesso!!!')
}

const updated_friend = event => {
  const actionElement = event.target.closest('.action');
  const dados = JSON.parse(actionElement.dataset.socialId);
  const url = `/friends/${dados.id}`;
  const options = {
    method: 'PATCH',
    headers,
    body: JSON.stringify({friend: dados})
  }

  connection(url, options)
}

const connection = (url, options) => {

  fetch(url, options)
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(errors => console.log('ERROR: ' + errors))
}
