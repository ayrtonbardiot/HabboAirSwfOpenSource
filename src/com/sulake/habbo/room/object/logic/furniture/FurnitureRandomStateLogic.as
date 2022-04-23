// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture.FurnitureRandomStateLogic

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.habbo.room.events.RoomObjectStateChangeEvent;

    public class FurnitureRandomStateLogic extends _SafeStr_3108 
    {


        override public function getEventTypes():Array
        {
            var _local_1:Array = ["ROSCE_STATE_RANDOM"];
            return (getAllEventTypes(super.getEventTypes(), _local_1));
        }

        override public function mouseEvent(_arg_1:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
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
                    useObject();
                    return;
                default:
                    super.mouseEvent(_arg_1, _arg_2);
                    return;
            };
        }

        override public function useObject():void
        {
            var _local_1:* = null;
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                _local_1 = new RoomObjectStateChangeEvent("ROSCE_STATE_RANDOM", object);
                eventDispatcher.dispatchEvent(_local_1);
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_3108 = "_-32g" (String#980, DoABC#4)


