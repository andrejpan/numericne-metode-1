function c = vander_interp(x, y)

V = vander (x)
c = V \ y'

end
