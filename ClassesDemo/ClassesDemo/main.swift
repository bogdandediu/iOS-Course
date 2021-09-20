
var skeleton = Enemy(health: 100, attackStrength: 10)
var dragon = Dragon(health: 100, attackStrength: 15)

print(skeleton.health)
dragon.move()
dragon.attack()
dragon.talk(speech: "Hi")
