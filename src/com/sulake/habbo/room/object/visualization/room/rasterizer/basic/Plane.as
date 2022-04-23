// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.room.rasterizer.basic.Plane

package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.room.utils.IRoomGeometry;

    public class Plane 
    {

        private var _SafeStr_6692:_SafeStr_24;
        private var _SafeStr_4094:Array = [];
        private var _lastPlaneVisualization:PlaneVisualization = null;
        private var _SafeStr_4096:int = -1;

        public function Plane()
        {
            _SafeStr_6692 = new _SafeStr_24();
        }

        public function isStatic(_arg_1:int):Boolean
        {
            return (true);
        }

        public function dispose():void
        {
            var _local_1:* = null;
            var _local_2:int;
            if (_SafeStr_6692 != null)
            {
                _local_1 = null;
                _local_2 = 0;
                while (_local_2 < _SafeStr_6692.length)
                {
                    _local_1 = (_SafeStr_6692.getWithIndex(_local_2) as PlaneVisualization);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                    _local_2++;
                };
                _SafeStr_6692.dispose();
                _SafeStr_6692 = null;
            };
            _lastPlaneVisualization = null;
            _SafeStr_4094 = null;
        }

        public function clearCache():void
        {
            var _local_2:int;
            var _local_1:* = null;
            _local_2 = 0;
            while (_local_2 < _SafeStr_6692.length)
            {
                _local_1 = (_SafeStr_6692.getWithIndex(_local_2) as PlaneVisualization);
                if (_local_1 != null)
                {
                    _local_1.clearCache();
                };
                _local_2++;
            };
        }

        public function createPlaneVisualization(_arg_1:int, _arg_2:int, _arg_3:IRoomGeometry):PlaneVisualization
        {
            if (_SafeStr_6692.getValue(String(_arg_1)) != null)
            {
                return (null);
            };
            var _local_4:PlaneVisualization = new PlaneVisualization(_arg_1, _arg_2, _arg_3);
            _SafeStr_6692.add(String(_arg_1), _local_4);
            _SafeStr_4094.push(_arg_1);
            _SafeStr_4094.sort();
            return (_local_4);
        }

        private function getSizeIndex(_arg_1:int):int
        {
            var _local_3:int;
            var _local_2:int;
            _local_3 = 1;
            while (_local_3 < _SafeStr_4094.length)
            {
                if (_SafeStr_4094[_local_3] > _arg_1)
                {
                    if ((_SafeStr_4094[_local_3] - _arg_1) < (_arg_1 - _SafeStr_4094[(_local_3 - 1)]))
                    {
                        _local_2 = _local_3;
                    };
                    break;
                };
                _local_2 = _local_3;
                _local_3++;
            };
            return (_local_2);
        }

        protected function getPlaneVisualization(_arg_1:int):PlaneVisualization
        {
            if (_arg_1 == _SafeStr_4096)
            {
                return (_lastPlaneVisualization);
            };
            var _local_2:int = getSizeIndex(_arg_1);
            if (_local_2 < _SafeStr_4094.length)
            {
                _lastPlaneVisualization = (_SafeStr_6692.getValue(_SafeStr_4094[_local_2]) as PlaneVisualization);
            }
            else
            {
                _lastPlaneVisualization = null;
            };
            _SafeStr_4096 = _arg_1;
            return (_lastPlaneVisualization);
        }

        public function getLayers():Array
        {
            return (getPlaneVisualization(_SafeStr_4096).getLayers());
        }


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.basic

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_4094 = "_-JU" (String#2100, DoABC#4)
// _SafeStr_4096 = "_-ke" (String#5744, DoABC#4)
// _SafeStr_6692 = "_-L1s" (String#5244, DoABC#4)


