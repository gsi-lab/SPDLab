classdef UnitClass % Class for storing technology specific design and uncertainty spaces.
    properties
        KEY
        FullName
        DesignSpace
        UncertainSpace
    end
    methods
        function obj = UnitClass(S) % Constructor
            if nargin>0
                obj.KEY            = S.KEY;
                obj.FullName       = S.FullName;
                obj.DesignSpace    = S.DesignSpace;
                obj.UncertainSpace = S.UncertainSpace;
            end
        end
    end
end