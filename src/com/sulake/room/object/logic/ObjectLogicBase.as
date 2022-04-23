// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.object.logic.ObjectLogicBase

package com.sulake.room.object.logic
{
    import flash.events.IEventDispatcher;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class ObjectLogicBase implements IRoomObjectEventHandler 
    {

        private var _SafeStr_3983:IEventDispatcher;
        private var _SafeStr_3984:IRoomObjectController;


        public function get eventDispatcher():IEventDispatcher
        {
            return (_SafeStr_3983);
        }

        public function set eventDispatcher(_arg_1:IEventDispatcher):void
        {
            _SafeStr_3983 = _arg_1;
        }

        public function getEventTypes():Array
        {
            return ([]);
        }

        protected function getAllEventTypes(_arg_1:Array, _arg_2:Array):Array
        {
            var _local_3:Array = _arg_1.concat();
            for each (var _local_4:String in _arg_2)
            {
                if (_local_3.indexOf(_local_4) < 0)
                {
                    _local_3.push(_local_4);
                };
            };
            return (_local_3);
        }

        public function dispose():void
        {
            _SafeStr_3984 = null;
        }

        public function set object(_arg_1:IRoomObjectController):void
        {
            if (_SafeStr_3984 == _arg_1)
            {
                return;
            };
            if (_SafeStr_3984 != null)
            {
                _SafeStr_3984.setEventHandler(null);
            };
            if (_arg_1 == null)
            {
                dispose();
                _SafeStr_3984 = null;
            }
            else
            {
                _SafeStr_3984 = _arg_1;
                _SafeStr_3984.setEventHandler(this);
            };
        }

        public function get object():IRoomObjectController
        {
            return (_SafeStr_3984);
        }

        public function mouseEvent(_arg_1:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
        }

        public function initialize(_arg_1:XML):void
        {
        }

        public function update(_arg_1:int):void
        {
        }

        public function processUpdateMessage(_arg_1:RoomObjectUpdateMessage):void
        {
            if (_arg_1 != null)
            {
                if (_SafeStr_3984 != null)
                {
                    _SafeStr_3984.setLocation(_arg_1.loc);
                    _SafeStr_3984.setDirection(_arg_1.dir);
                };
            };
        }

        public function useObject():void
        {
        }

        public function tearDown():void
        {
        }

        public function get widget():String
        {
            return (null);
        }

        public function get contextMenu():String
        {
            return (null);
        }


    }
}//package com.sulake.room.object.logic

// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_3984 = "_-Ej" (String#1774, DoABC#4)


