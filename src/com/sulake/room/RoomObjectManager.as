// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.RoomObjectManager

package com.sulake.room
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.room.object.RoomObject;
    import com.sulake.room.object.IRoomObjectController;

    public class RoomObjectManager implements IRoomObjectManager 
    {

        private var _SafeStr_4621:_SafeStr_24;
        private var _SafeStr_4622:_SafeStr_24;

        public function RoomObjectManager()
        {
            _SafeStr_4621 = new _SafeStr_24();
            _SafeStr_4622 = new _SafeStr_24();
        }

        public function dispose():void
        {
            reset();
            if (_SafeStr_4621 != null)
            {
                _SafeStr_4621.dispose();
                _SafeStr_4621 = null;
            };
            if (_SafeStr_4622 != null)
            {
                _SafeStr_4622.dispose();
                _SafeStr_4622 = null;
            };
        }

        public function createObject(_arg_1:int, _arg_2:uint, _arg_3:String):IRoomObjectController
        {
            var _local_4:RoomObject = new RoomObject(_arg_1, _arg_2, _arg_3);
            return (addObject(String(_arg_1), _arg_3, _local_4));
        }

        private function addObject(_arg_1:String, _arg_2:String, _arg_3:IRoomObjectController):IRoomObjectController
        {
            if (_SafeStr_4621.getValue(_arg_1) != null)
            {
                _arg_3.dispose();
                return (null);
            };
            _SafeStr_4621.add(_arg_1, _arg_3);
            var _local_4:_SafeStr_24 = getObjectsForType(_arg_2);
            _local_4.add(_arg_1, _arg_3);
            return (_arg_3);
        }

        private function getObjectsForType(_arg_1:String, _arg_2:Boolean=true):_SafeStr_24
        {
            var _local_3:_SafeStr_24 = _SafeStr_4622.getValue(_arg_1);
            if (((_local_3 == null) && (_arg_2)))
            {
                _local_3 = new _SafeStr_24();
                _SafeStr_4622.add(_arg_1, _local_3);
            };
            return (_local_3);
        }

        public function getObject(_arg_1:int):IRoomObjectController
        {
            return (_SafeStr_4621.getValue(String(_arg_1)) as IRoomObjectController);
        }

        public function getObjects():Array
        {
            return (_SafeStr_4621.getValues());
        }

        public function getObjectWithIndex(_arg_1:int):IRoomObjectController
        {
            return (_SafeStr_4621.getWithIndex(_arg_1) as IRoomObjectController);
        }

        public function getObjectCount():int
        {
            return (_SafeStr_4621.length);
        }

        public function getObjectCountForType(_arg_1:String):int
        {
            var _local_2:_SafeStr_24 = getObjectsForType(_arg_1, false);
            if (_local_2 != null)
            {
                return (_local_2.length);
            };
            return (0);
        }

        public function getObjectWithIndexAndType(_arg_1:int, _arg_2:String):IRoomObjectController
        {
            var _local_4:* = null;
            var _local_3:_SafeStr_24 = getObjectsForType(_arg_2, false);
            if (_local_3 != null)
            {
                _local_4 = (_local_3.getWithIndex(_arg_1) as IRoomObjectController);
                return (_local_4);
            };
            return (null);
        }

        public function disposeObject(_arg_1:int):Boolean
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_3:String = String(_arg_1);
            var _local_5:RoomObject = (_SafeStr_4621.remove(_local_3) as RoomObject);
            if (_local_5 != null)
            {
                _local_4 = _local_5.getType();
                _local_2 = getObjectsForType(_local_4, false);
                if (_local_2 != null)
                {
                    _local_2.remove(_local_3);
                };
                _local_5.dispose();
                return (true);
            };
            return (false);
        }

        public function reset():void
        {
            var _local_2:int;
            var _local_4:* = null;
            var _local_3:int;
            var _local_1:* = null;
            if (_SafeStr_4621 != null)
            {
                _local_2 = 0;
                while (_local_2 < _SafeStr_4621.length)
                {
                    _local_4 = (_SafeStr_4621.getWithIndex(_local_2) as IRoomObjectController);
                    if (_local_4 != null)
                    {
                        _local_4.dispose();
                    };
                    _local_2++;
                };
                _SafeStr_4621.reset();
            };
            if (_SafeStr_4622 != null)
            {
                _local_3 = 0;
                while (_local_3 < _SafeStr_4622.length)
                {
                    _local_1 = (_SafeStr_4622.getWithIndex(_local_3) as _SafeStr_24);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                    _local_3++;
                };
                _SafeStr_4622.reset();
            };
        }


    }
}//package com.sulake.room

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_4621 = "_-21w" (String#2166, DoABC#4)
// _SafeStr_4622 = "_-c1o" (String#5785, DoABC#4)


