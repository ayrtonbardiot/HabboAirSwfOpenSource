// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture.FurnitureFireworksLogic

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectStateChangeEvent;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureFireworksLogic extends _SafeStr_3108 
    {


        override public function getEventTypes():Array
        {
            var _local_1:Array = ["ROSCE_STATE_CHANGE"];
            return (getAllEventTypes(super.getEventTypes(), _local_1));
        }

        override public function mouseEvent(_arg_1:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
            var _local_3:* = null;
            if (((_arg_1 == null) || (_arg_2 == null)))
            {
                return;
            };
            if (object == null)
            {
                return;
            };
            switch (_arg_1.type)
            {
                case "doubleClick":
                    switch (_arg_1.spriteTag)
                    {
                        case "start_stop":
                            _local_3 = new RoomObjectStateChangeEvent("ROSCE_STATE_CHANGE", object, 1);
                            break;
                        case "reset":
                            _local_3 = new RoomObjectStateChangeEvent("ROSCE_STATE_CHANGE", object, 2);
                    };
            };
            if (((!(eventDispatcher == null)) && (!(_local_3 == null))))
            {
                eventDispatcher.dispatchEvent(_local_3);
            }
            else
            {
                super.mouseEvent(_arg_1, _arg_2);
            };
        }

        override public function useObject():void
        {
            var _local_1:* = null;
            if (object != null)
            {
                _local_1 = new RoomObjectStateChangeEvent("ROSCE_STATE_CHANGE", object, 0);
                if (eventDispatcher != null)
                {
                    eventDispatcher.dispatchEvent(_local_1);
                };
            };
        }

        override public function initialize(_arg_1:XML):void
        {
            var _local_3:* = null;
            super.initialize(_arg_1);
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:XMLList = _arg_1.particlesystems;
            if (_local_2.length() == 0)
            {
                return;
            };
            if (object != null)
            {
                _local_3 = object.getModelController();
                if (_local_3 != null)
                {
                    _local_3.setString("furniture_fireworks_data", _local_2);
                };
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_3108 = "_-32g" (String#980, DoABC#4)


