farms = Farm.create([
  { name: 'Roga & Kopyta LLC', city: 'Kiev' },
  { name: 'Kolhoz Krasnyi Lenin', city: 'Kharkov' },
  { name: 'Selo Chervone Dyshlo', city: 'Brovary' },
])

Pumpkin.create([
  { name: 'Jack', weight: '2500', softness: 'hard', farm: farms.first },
  { name: 'The Nightmare', weight: '2700', softness: 'middle', farm: farms.first },
  { name: 'The Red Horror', weight: '3200', softness: 'soft', farm: farms.last },
])

User.create([
  { name: 'Roman' },
  { name: 'Vasya' },
])