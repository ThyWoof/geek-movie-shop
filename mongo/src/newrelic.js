db = db.getSiblingDB('admin');

db.createRole({
    role: "listCollections",
    privileges: [{
        resource: {db:"",collection:""},
        actions: ["listCollections"]
    }],
    roles: []
});

db.createUser({
    user: "newrelic",
    pwd: "newrelic",
    roles: [
        "clusterMonitor",
        "listCollections"
    ]
});