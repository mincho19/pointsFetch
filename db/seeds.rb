
Payer.delete_all

print "Deleting All Payers...\n"
print "Seeding Data...\n"

# p1 = Payer.create(name: "DANNON", points: 0, spent: 0)
# p2 = Payer.create(name: "UNILEVER", points: 0, spent: 0)
# p3 = Payer.create(name: "MILLER COORS", points: 0, spent: 0)

# t1 = p1.transactions.create(points: 1000, timestamp: "2020-11-02T14:00:00Z")
# t2 = p1.transactions.create(points: 2000, timestamp: "2020-10-31T11:00:00Z")
# t3 = p1.transactions.create(points: 3000, timestamp: "2020-10-31T15:00:00Z")
# t4 = p1.transactions.create(points: 4000, timestamp: "2020-11-01T14:00:00Z")
# t5 = p1.transactions.create(points: 4000, timestamp: "2020-10-31T10:00:00Z")

# { "payer": "DANNON", "points": 1000, "timestamp": "2020-11-02T14:00:00Z" }
# ● { "payer": "UNILEVER", "points": 200, "timestamp": "2020-10-31T11:00:00Z" }
# ● { "payer": "DANNON", "points": -200, "timestamp": "2020-10-31T15:00:00Z" }
# ● { "payer": "MILLER COORS", "points": 10000, "timestamp": "2020-11-01T14:00:00Z" }
# ● { "payer": "DANNON", "points": 300, "timestamp": "2020-10-31T10:00:00Z" }