#!/usr/bin/python

# Source - https://stackoverflow.com/a/44506462
# Posted by MarredCheese, modified by community. See post 'Timeline' for change history
# Retrieved 2026-01-14, License - CC BY-SA 4.0

import requests
import pandas as pd

#url = 'http://localhost:8080'
url = 'https://en.kancollewiki.net/Ship/Rarity'
html = requests.get(url).content
df_list = pd.read_html(html)
df = df_list[-1]
typelist = ['DD', 'CL', 'CLT', 'CA', 'CAV', 'CT', 'BB', 'FBB', 'BBV', 'CV', 'CVB', 'CVL', 'AV', 'SS', 'SSV', 'LHA', 'AR', 'AS', 'AO', 'DE']
rarelist = ['common', 'rare', 'vrare', 'holo', 'sholo']

df.to_csv('generated/ships.csv', index=False, header=False)

#Pad ID strings with leading zeros to match filenames
df['Id'] = df['Id'].str.zfill(4)



df.drop(columns=['Card', 'API Rarity', 'Difference'], inplace=True)
df.replace(regex={r'\d .*ommon$': 'common', '^4 Rare$': 'rare', '^5 Very Rare$': 'vrare', '^6 Holo$': 'holo', r'^\d S* Holo': 'sholo'}, inplace=True)
print(df)


def sortBy(sType, cRare):
    # sType can be 'DD' 'CL' 'CLT' 'CA' 'CAV'
    # 'BB' 'FBB' 'BBV' 'CV' 'CVB' 'CVL' 'AV'
    # 'SS' 'SSV' 'LHA' 'AR' 'AS' 'AO' 'DE'
    # cRare can be 'common' 'rare' 'vrare' 'holo' 'sholo'
    dfl = df[df['Type'] == sType]
    dfl = dfl[dfl['Card Rarity'] == cRare]
    if dfl.empty:
        print(sType + cRare, 'empty')
        return('empty')
    else:
        dfl.to_csv(str('generated/' + sType + cRare + '.csv'), index=False, header=False, columns=['Id'])



for shp in typelist:
    for rar in rarelist:
        sortBy(shp, rar)

