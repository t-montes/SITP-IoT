
# read and parse into a list (separated by ,) the routes.txt file
with open('routes.txt', 'r') as f:
    routes = []
    for line in f:
        l = line.strip().split(',')
        routes.append({
            'base': l[0],
            'route': l[1],
            'next': [l[i] for i in range(2, len(l))]
        })

with open('Station.csc', 'r') as f:
    template = f.read()

# for each route, generate a Station{route}.csc file
for route in routes:
    script = template
    # replace {{route}} with the route name
    script = script.replace('{{route}}', route['route'])
    # replace {{num_neighbors}} with the number of neighbors
    script = script.replace('{{num_neighbors}}', str(len(route['next'])))
    # replace {{script_set_neighbors}} for \n separated scripts with the form "tset {item} t {i} 0"
    script = script.replace('{{script_set_neighbors}}', '\n'.join([f'tset {item} t {i} 0' for i, item in enumerate(route['next'])]))
    
    with open(f'Station{route["base"]}.csc', 'w') as f:
        f.write(script)

