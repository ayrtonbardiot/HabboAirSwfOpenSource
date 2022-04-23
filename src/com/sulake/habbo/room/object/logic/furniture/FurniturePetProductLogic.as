// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture.FurniturePetProductLogic

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;

    public class FurniturePetProductLogic extends _SafeStr_3108 
    {


        override public function getEventTypes():Array
        {
            var _local_1:Array = [];
            _local_1.push("ROWRE_PET_PRODUCT_MENU");
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

        override public function processUpdateMessage(_arg_1:RoomObjectUpdateMessage):void
        {
            super.processUpdateMessage(_arg_1);
            if (object == null)
            {
                return;
            };
            if (object.getModelController().getNumber("furniture_real_room_object") == 1)
            {
                object.getModelController().setString("RWEIEP_INFOSTAND_EXTRA_PARAM", "RWEIEP_USABLE_PRODUCT");
            };
        }

        override public function useObject():void
        {
            var _local_1:* = null;
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                _local_1 = new RoomObjectWidgetRequestEvent("ROWRE_PET_PRODUCT_MENU", object);
                eventDispatcher.dispatchEvent(_local_1);
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_3108 = "_-32g" (String#980, DoABC#4)


