// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture._SafeStr_3124

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;

    public class _SafeStr_3124 extends _SafeStr_3108 
    {

        private var _SafeStr_4102:Boolean = false;
        private var _SafeStr_4103:int = 0;


        override public function initialize(_arg_1:XML):void
        {
            super.initialize(_arg_1);
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:XMLList = _arg_1.action;
            if (_local_2.length() != 0)
            {
                if (_local_2.@startState == "1")
                {
                    _SafeStr_4102 = true;
                };
            };
        }

        override public function update(_arg_1:int):void
        {
            super.update(_arg_1);
            if (!_SafeStr_4102)
            {
                return;
            };
            _SafeStr_4103++;
            if (((_SafeStr_4102) && (_SafeStr_4103 > 20)))
            {
                setAnimationState(1);
                _SafeStr_4102 = false;
            };
        }

        public function setAnimationState(_arg_1:int):void
        {
            if (object == null)
            {
                return;
            };
            var _local_2:IRoomObjectModelController = object.getModelController();
            if (_local_2 != null)
            {
                _local_2.setNumber("furniture_automatic_state_index", _arg_1, false);
            };
        }

        override public function mouseEvent(_arg_1:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            if (_arg_1.type == "doubleClick")
            {
                setAnimationState(0);
            };
            super.mouseEvent(_arg_1, _arg_2);
        }

        override public function getEventTypes():Array
        {
            return (getAllEventTypes(super.getEventTypes(), ["ROWRE_INTERNAL_LINK"]));
        }

        override public function useObject():void
        {
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                eventDispatcher.dispatchEvent(new RoomObjectWidgetRequestEvent("ROWRE_INTERNAL_LINK", object));
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_3108 = "_-32g" (String#980, DoABC#4)
// _SafeStr_3124 = "_-J1g" (String#22215, DoABC#4)
// _SafeStr_4102 = "_-j1V" (String#5643, DoABC#4)
// _SafeStr_4103 = "_-t1b" (String#7176, DoABC#4)


