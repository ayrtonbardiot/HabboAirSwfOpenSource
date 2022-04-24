// by nota

//com.sulake.habbo.roomevents.userdefinedroomevents.RoomObjectHightLighter

package com.sulake.habbo.roomevents.userdefinedroomevents
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import flash.display.Shader;
    import flash.utils.ByteArray;
    import flash.filters.ShaderFilter;
    import flash.utils.Dictionary;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;

    public class RoomObjectHightLighter 
    {

        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _filterBW:Array;

        public function RoomObjectHightLighter(_arg_1:HabboUserDefinedRoomEvents)
        {
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_3:* = null;
            var _local_5:* = null;
            super();
            _roomEvents = _arg_1;
            _local_2 = furnitureFilter_pbj$5b51dd400f82d19cd3c27c61e8dd09011566352002;
            _local_4 = new Shader((new (_local_2)() as ByteArray));
            _local_6 = new ShaderFilter(_local_4);
            _filterBW = [_local_6];
        }

        public function hide(_arg_1:int):void
        {
            inactivateFurni(getFurni(_arg_1));
        }

        public function hideAll(_arg_1:Dictionary):void
        {
            for (var _local_2:String in _arg_1)
            {
                _SafeStr_14.log(("Show furni as unselected: " + _local_2));
                inactivateFurni(getFurni(parseInt(_local_2)));
            };
        }

        public function show(_arg_1:int):void
        {
            activateFurni(getFurni(_arg_1));
        }

        public function showAll(_arg_1:Dictionary):void
        {
            for (var _local_2:String in _arg_1)
            {
                _SafeStr_14.log(("Show furni as selected: " + _local_2));
                activateFurni(getFurni(parseInt(_local_2)));
            };
        }

        private function getFurni(_arg_1:int):IRoomObject
        {
            return (_roomEvents.roomEngine.getRoomObject(_roomEvents.roomId, _arg_1, 10));
        }

        private function activateFurni(_arg_1:IRoomObject):void
        {
            var _local_2:* = null;
            var _local_4:int;
            var _local_3:* = null;
            if (_arg_1)
            {
                _local_2 = (_arg_1.getVisualization() as IRoomObjectSpriteVisualization);
                _SafeStr_14.log(("Furni visualization: " + _local_2));
                _local_4 = 0;
                while (_local_4 < _local_2.spriteCount)
                {
                    _local_3 = _local_2.getSprite(_local_4);
                    if (_local_3.blendMode != "add")
                    {
                        _local_3.filters = _filterBW;
                    };
                    _local_4++;
                };
            };
        }

        private function inactivateFurni(_arg_1:IRoomObject):void
        {
            var _local_2:* = null;
            var _local_4:int;
            var _local_3:* = null;
            if (_arg_1)
            {
                _local_2 = (_arg_1.getVisualization() as IRoomObjectSpriteVisualization);
                _SafeStr_14.log(("Furni visualization: " + _local_2));
                _local_4 = 0;
                while (_local_4 < _local_2.spriteCount)
                {
                    _local_3 = _local_2.getSprite(_local_4);
                    _local_3.filters = [];
                    _local_4++;
                };
            };
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)


