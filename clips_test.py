import clips
import logging
import os

logging.basicConfig(level=logging.DEBUG, force=True, format='%(message)s')

env = clips.Environment()
router = clips.LoggingRouter()
env.add_router(router)

#env.build(DEFFACTS_start)

env.load('facts.clp')
env.load('rules.clp')

env.reset()

print("Facts:\n")
for fact in env.facts():
    print(fact)

print("Rules:\n")
for rule in env.rules():
    print(rule)

while True:
    print("\n")
    env.run()
    question=""
    for fact in env.facts():
        if fact.template.name=='question':
            for elem in fact:
                question+=elem.capitalize()
                print(elem, end=' ')
    print("\n")
    for fact in env.facts():
        if fact.template.name=='answers':
            for elem in fact:
                print(elem)
    genre=input()
    env.assert_string('('+question+' '+genre+')')
    env.assert_string('(token ask)')

    env.run()
#print(DEFFACTS_genre)
#env.build(DEFFACTS_genre)