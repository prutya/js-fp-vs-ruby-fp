const fetch = require('node-fetch')

const getFromApi = baseUrl => endpoint => callback =>
  fetch(`${baseUrl}${endpoint}`)
    .then(res => res.json())
    .then(data => callback(data))
    .catch(err => {
      console.error(err.message)
    })

const getGithub = getFromApi('https://api.github.com')

const getGithubUsers = getGithub('/users')
const getGithubRepos = getGithub('/repositories')

const prop = key => obj => obj[key]

const propLogin     = prop('login')
const propAvatarUrl = prop('avatar_url')

getGithubUsers(data => {
  console.log(data.map(propLogin))
})

getGithubUsers(data => console.log(data.map(propAvatarUrl)))
