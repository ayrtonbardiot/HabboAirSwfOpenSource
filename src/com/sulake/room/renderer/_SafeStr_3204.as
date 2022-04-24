// by nota

//com.sulake.room.renderer._SafeStr_3204

package com.sulake.room.renderer
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.runtime.Component;
    import com.sulake.room.object.IRoomObject;
    import flash.utils.getTimer;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.room.utils.RoomGeometry;

    [SecureSWF(rename="true")]
    public class _SafeStr_3204 implements IRoomRenderer, _SafeStr_3203 
    {

        private var _SafeStr_4621:_SafeStr_24;
        private var _SafeStr_4805:_SafeStr_24;
        private var _SafeStr_4147:Component;
        private var _disposed:Boolean = false;
        private var _SafeStr_4804:String = null;

        public function _SafeStr_3204(_arg_1:Component)
        {
            _SafeStr_4621 = new _SafeStr_24();
            _SafeStr_4805 = new _SafeStr_24();
            if (_arg_1 != null)
            {
                _SafeStr_4147 = _arg_1;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get roomObjectVariableAccurateZ():String
        {
            return (_SafeStr_4804);
        }

        public function set roomObjectVariableAccurateZ(_arg_1:String):void
        {
            _SafeStr_4804 = _arg_1;
        }

        public function dispose():void
        {
            var _local_2:int;
            var _local_1:* = null;
            if (disposed)
            {
                return;
            };
            if (_SafeStr_4805 != null)
            {
                _local_2 = 0;
                while (_local_2 < _SafeStr_4805.length)
                {
                    _local_1 = (_SafeStr_4805.getWithIndex(_local_2) as _SafeStr_3381);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                    _local_2++;
                };
                _SafeStr_4805.dispose();
                _SafeStr_4805 = null;
            };
            if (_SafeStr_4621 != null)
            {
                _SafeStr_4621.dispose();
                _SafeStr_4621 = null;
            };
            if (_SafeStr_4147 != null)
            {
                _SafeStr_4147 = null;
            };
            _disposed = true;
        }

        public function reset():void
        {
            _SafeStr_4621.reset();
        }

        public function getRoomObjectIdentifier(_arg_1:IRoomObject):String
        {
            if (_arg_1 != null)
            {
                return (_arg_1.getInstanceId());
            };
            return (null);
        }

        public function feedRoomObject(_arg_1:IRoomObject):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_4621.add(getRoomObjectIdentifier(_arg_1), _arg_1);
        }

        public function removeRoomObject(_arg_1:IRoomObject):void
        {
            var _local_3:int;
            var _local_2:* = null;
            var _local_4:String = getRoomObjectIdentifier(_arg_1);
            _SafeStr_4621.remove(_local_4);
            _local_3 = 0;
            while (_local_3 < _SafeStr_4805.length)
            {
                _local_2 = (_SafeStr_4805.getWithIndex(_local_3) as _SafeStr_3381);
                if (_local_2 != null)
                {
                    _local_2.roomObjectRemoved(_local_4);
                };
                _local_3++;
            };
        }

        public function getRoomObject(_arg_1:String):IRoomObject
        {
            return (_SafeStr_4621.getValue(_arg_1) as IRoomObject);
        }

        public function getRoomObjectWithIndex(_arg_1:int):IRoomObject
        {
            return (_SafeStr_4621.getWithIndex(_arg_1) as IRoomObject);
        }

        public function getRoomObjectIdWithIndex(_arg_1:int):String
        {
            return (_SafeStr_4621.getKey(_arg_1) as String);
        }

        public function getRoomObjectCount():int
        {
            return (_SafeStr_4621.length);
        }

        public function render():void
        {
            var _local_3:int;
            var _local_2:* = null;
            var _local_1:int = getTimer();
            ErrorReportStorage.addDebugData("Canvas count", _SafeStr_4805.length);
            _local_3 = (_SafeStr_4805.length - 1);
            while (_local_3 >= 0)
            {
                _local_2 = (_SafeStr_4805.getWithIndex(_local_3) as IRoomRenderingCanvas);
                if (_local_2 != null)
                {
                    _local_2.render(_local_1);
                };
                _local_3--;
            };
        }

        public function createCanvas(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):IRoomRenderingCanvas
        {
            var _local_6:* = null;
            var _local_5:IRoomRenderingCanvas = (_SafeStr_4805.getValue(String(_arg_1)) as IRoomRenderingCanvas);
            if (_local_5 != null)
            {
                _local_5.initialize(_arg_2, _arg_3);
                _local_6 = (_local_5.geometry as RoomGeometry);
                if (_local_6)
                {
                    _local_6.scale = _arg_4;
                };
                return (_local_5);
            };
            _local_5 = createCanvasInstance(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_4805.add(String(_arg_1), _local_5);
            return (_local_5);
        }

        protected function createCanvasInstance(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):IRoomRenderingCanvas
        {
            return (new _SafeStr_3387(this, _arg_1, _arg_2, _arg_3, _arg_4));
        }

        public function getCanvas(_arg_1:int):IRoomRenderingCanvas
        {
            return (_SafeStr_4805.getValue(String(_arg_1)) as IRoomRenderingCanvas);
        }

        public function disposeCanvas(_arg_1:int):Boolean
        {
            var _local_2:_SafeStr_3381 = (_SafeStr_4805.remove(String(_arg_1)) as _SafeStr_3381);
            if (_local_2 != null)
            {
                _local_2.dispose();
            };
            return (false);
        }

        public function update(_arg_1:uint):void
        {
            var _local_3:int;
            var _local_2:* = null;
            render();
            _local_3 = (_SafeStr_4805.length - 1);
            while (_local_3 >= 0)
            {
                _local_2 = (_SafeStr_4805.getWithIndex(_local_3) as _SafeStr_3381);
                if (_local_2 != null)
                {
                    _local_2.update();
                };
                _local_3--;
            };
        }


    }
}//package com.sulake.room.renderer

// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3203 = "_-5c" (String#8823, DoABC#4)
// _SafeStr_3204 = "_-Q1h" (String#12725, DoABC#4)
// _SafeStr_3381 = "_-m1y" (String#5604, DoABC#4)
// _SafeStr_3387 = "_-W1H" (String#14185, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_4621 = "_-21w" (String#2166, DoABC#4)
// _SafeStr_4804 = "_-b1p" (String#6471, DoABC#4)
// _SafeStr_4805 = "_-kW" (String#3232, DoABC#4)


