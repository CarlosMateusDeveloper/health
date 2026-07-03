import React from 'react'
import ReactDOM from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'

// Importando as páginas que criamos
import Dashboard from './pages/Home'
import Login from './pages/Sobre'

// Configurando o roteador com os caminhos e seus respectivos componentes
const router = createBrowserRouter([
  {
    path: "/",     
    element: <Dashboard />,
  },
  {
    path: "/login", 
    element: <Login />, 
  },
])

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    {/* Passamos o 'router' que configuramos acima como propriedade */}
    <RouterProvider router={router} />
  </React.StrictMode>,
)