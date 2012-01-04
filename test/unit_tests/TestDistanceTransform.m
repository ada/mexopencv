classdef TestDistanceTransform
    %TestDistanceTransform
    properties (Constant)
        img = uint8([...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 1 1 1 0 0 0 0;...
            0 0 0 1 1 1 0 0 0 0;...
            0 0 0 1 1 1 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            0 0 0 0 0 0 0 0 0 0;...
            ]);
    end
    
    methods (Static)
        function test_1
			rslt = single([...
				0 0 0 0 0 0 0 0 0 0;...
				0 0 0 0 0 0 0 0 0 0;...
				0 0 0 0 0 0 0 0 0 0;...
				0 0 0 1 1 1 0 0 0 0;...
				0 0 0 1 2 1 0 0 0 0;...
				0 0 0 1 1 1 0 0 0 0;...
				0 0 0 0 0 0 0 0 0 0;...
				0 0 0 0 0 0 0 0 0 0;...
				0 0 0 0 0 0 0 0 0 0;...
				0 0 0 0 0 0 0 0 0 0;...
				]);
            result = distanceTransform(TestDistanceTransform.img, 'DistanceType', 'L1');
            assert(all(rslt(:)==result(:)));
        end
        
        function test_2
            [result,labels] = distanceTransform(TestDistanceTransform.img);
        end
        
        function test_error_1
            try
                distanceTransform();
                throw('UnitTest:Fail');
            catch e
                assert(strcmp(e.identifier,'mexopencv:error'));
            end
        end
    end
    
end
