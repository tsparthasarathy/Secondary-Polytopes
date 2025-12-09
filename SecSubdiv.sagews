︠016bb0bd-678e-4f21-ace1-1f8f5c3f61a8︠

︡08391d39-616d-4ae1-a5fc-6384686cb3f5︡{"done":true}
︠24393a64-7f89-40f8-9242-90d49477a1da︠

#Computing subdivisions given a function f on vertices.
f = Psi[0]
f
A = [[i,i^2,i^3,f[i-1]] for i in range(1,8)]
#A = [[0,2,f[0]], [-1,0,f[1]], [1,0,f[2]], [0,1,f[3]]]
A
P = Polyhedron(vertices = A, rays = [[0,0,0,-1]])

ub_faces = [x for x in P.faces(3) if x.is_compact() == 1]
polyv_sdl=[[x.vector() for x in ub_faces[i].vertices()] for i in range(len(ub_faces)) ]
polyv_sd = []
for x in polyv_sdl:
    x_proj = []
    for i in range(len(x)):
        x_proj.append(vector([x[i][0],x[i][1],x[i][2]]))
    polyv_sd.append(x_proj)
for x in polyv_sd:
    x
poly_sd = []
for x in polyv_sd:
    poly_sd.append(Polyhedron(vertices = x))
poly_sd

     #sd[0].plot() + poly_sd[1].plot() + poly_sd[2].plot()


#Assume we are give a function f on the vertices




#P sP = P.secondary_polytope() sP sP.vertices() sP.facets()
︡80b11e9d-c89c-4e05-aaf8-45b6b055e4f7︡{"stdout":"(0, 0, 0, 0, 4, 15, 36)\n"}︡{"stdout":"[[1, 1, 1, 0], [2, 4, 8, 0], [3, 9, 27, 0], [4, 16, 64, 0], [5, 25, 125, 4], [6, 36, 216, 15], [7, 49, 343, 36]]\n"}︡{"stdout":"[(1, 1, 1), (2, 4, 8), (3, 9, 27), (7, 49, 343)]\n[(1, 1, 1), (3, 9, 27), (4, 16, 64), (5, 25, 125), (6, 36, 216), (7, 49, 343)]\n"}︡{"stdout":"[A 3-dimensional polyhedron in QQ^3 defined as the convex hull of 4 vertices, A 3-dimensional polyhedron in QQ^3 defined as the convex hull of 6 vertices]\n"}︡{"done":true}︡
︠9db53abc-f928-4c91-ab8b-ab680bd2da70︠
#Same code but better output formatting
n = 7
B = [[i, i^2, i^3] for i in range(1,n)]
B2 = PointConfiguration(B)
B_sec = B2.secondary_polytope()
Q = Polyhedron(vertices = B)
#Sadly sage does not have an inbuilt function to compute normal fan of a non-full dimensional polytope and the way secondary polytopes are defined they always have positive codimension.

#making a list of \psi
Psi = []
for i in B_sec.inequalities():
    Psi.append(-1*i.A())

#Computing subdivisions given a function f on vertices.
for j in range(len(Psi)):
    f = Psi[j]
    A = [[i,i^2,i^3,f[i-1]] for i in range(1,n)]
    #A = [[0,2,f[0]], [-1,0,f[1]], [1,0,f[2]], [0,1,f[3]]]
    P = Polyhedron(vertices = A, rays = [[0,0,0,-1]])

    ub_faces = [x for x in P.faces(3) if x.is_compact() == 1]
    polyv_sdl=[[x.vector() for x in ub_faces[i].vertices()] for i in range(len(ub_faces)) ]
    polyv_sd = []
    for x in polyv_sdl:
            x_proj = []
            for i in range(len(x)):
                x_proj.append([x[i][0]])
            polyv_sd.append(x_proj)
    print("The vertices of the subdivision are :")
    for x in polyv_sd:
         x
    print("--------------------------------------------------------------------------------------------- \n ")
︡c39aaac0-b8b1-45fb-aefa-5465c4026792︡{"stdout":"The vertices of the subdivision are :\n[[1], [2], [5], [6]]\n[[1], [2], [4], [5]]\n[[1], [2], [3], [4]]\n[[2], [3], [4], [5], [6]]\n--------------------------------------------------------------------------------------------- \n \nThe vertices of the subdivision are :\n[[3], [4], [5], [6]]\n[[1], [2], [5], [6]]\n[[2], [3], [5], [6]]\n[[1], [2], [3], [4], [5]]\n--------------------------------------------------------------------------------------------- \n \nThe vertices of the subdivision are :\n[[2], [3], [4], [6]]\n[[1], [2], [3], [4]]\n[[1], [2], [4], [5], [6]]\n--------------------------------------------------------------------------------------------- \n \nThe vertices of the subdivision are :\n[[3], [4], [5], [6]]\n[[1], [3], [4], [5]]\n[[1], [2], [3], [5], [6]]\n--------------------------------------------------------------------------------------------- \n \nThe vertices of the subdivision are :\n[[1], [2], [3], [6]]\n[[1], [3], [4], [5], [6]]\n--------------------------------------------------------------------------------------------- \n \nThe vertices of the subdivision are :\n[[1], [4], [5], [6]]\n[[1], [2], [3], [4], [6]]\n--------------------------------------------------------------------------------------------- \n \n"}︡{"done":true}










