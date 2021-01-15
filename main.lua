local function noop()end

local function unpack(arr, from, to)
   from = from or 1
   to = to or #arr
   if (from > to) return
   return arr[from], unpack(arr, from + 1, to)
end

local function center(subject)
   return (type(subject) == "string" or type(subject) == "number") and ((126 - #tostr(subject) * 4) / 2) or ((127 - subject.width) / 2)
end

local function get_distance(x1, y1, x2, y2)
   return sqrt((y2 - y1) ^ 2 + (x2 - x1) ^ 2)
end

local class do
   local mt = setmetatable({
      x = 0,
      y = 0,
      update = noop,
      draw = noop,
      init = noop,
      __call = function(self, o)
         o = o or {}
         setmetatable(o, self)
         self.__index = self
         self.__call = getmetatable(self).__call
         o:init(self)

         return o
      end
   }, _G)
   mt.__index = mt
   class = setmetatable({}, mt)
end
