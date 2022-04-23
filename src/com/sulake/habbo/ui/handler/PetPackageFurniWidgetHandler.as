// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.handler.PetPackageFurniWidgetHandler

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenPetPackageMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionPetPackageEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetPackageUpdateEvent;
    import flash.events.Event;
    import flash.display.BitmapData;
    import com.sulake.room.utils.Vector3d;
    import _-Zz._SafeStr_1552;

    public class PetPackageFurniWidgetHandler implements IRoomWidgetHandler, _SafeStr_3140 
    {

        private var _SafeStr_4036:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _SafeStr_4157:int = -1;


        public function get type():String
        {
            return ("RWE_FURNI_PET_PACKAGE_WIDGET");
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
        }

        public function getWidgetMessages():Array
        {
            return (["RWOPPM_OPEN_PET_PACKAGE"]);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:* = null;
            switch (_arg_1.type)
            {
                case "RWOPPM_OPEN_PET_PACKAGE":
                    _local_2 = (_arg_1 as RoomWidgetOpenPetPackageMessage);
                    if (((!(_container == null)) && (!(_container.roomSession == null))))
                    {
                        _container.roomSession.sendOpenPetPackageMessage(_local_2.objectId, _local_2.name);
                    };
            };
            return (null);
        }

        public function getProcessedEvents():Array
        {
            return (["RSOPPE_OPEN_PET_PACKAGE_REQUESTED", "RSOPPE_OPEN_PET_PACKAGE_RESULT"]);
        }

        public function processEvent(_arg_1:Event):void
        {
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_6:int;
            var _local_2:int;
            var _local_7:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            if ((((!(_container == null)) && (!(_container.events == null))) && (!(_arg_1 == null))))
            {
                switch (_arg_1.type)
                {
                    case "RSOPPE_OPEN_PET_PACKAGE_REQUESTED":
                        _local_5 = (_arg_1 as RoomSessionPetPackageEvent);
                        _SafeStr_4157 = _local_5.objectId;
                        _local_4 = getPetImage(_local_5.figureData);
                        _local_6 = ((_local_5.figureData == null) ? -1 : _local_5.figureData.typeId);
                        _local_3 = new RoomWidgetPetPackageUpdateEvent("RWOPPUE_OPEN_PET_PACKAGE_REQUESTED", _SafeStr_4157, _local_4, -1, null, _local_6);
                        _container.events.dispatchEvent(_local_3);
                        return;
                    case "RSOPPE_OPEN_PET_PACKAGE_RESULT":
                        _local_5 = (_arg_1 as RoomSessionPetPackageEvent);
                        _SafeStr_4157 = _local_5.objectId;
                        _local_2 = _local_5.nameValidationStatus;
                        _local_7 = _local_5.nameValidationInfo;
                        _local_3 = new RoomWidgetPetPackageUpdateEvent("RWOPPUE_OPEN_PET_PACKAGE_RESULT", _SafeStr_4157, null, _local_2, _local_7, -1);
                        _container.events.dispatchEvent(_local_3);
                        return;
                };
            };
        }

        public function update():void
        {
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
            _container = null;
            _SafeStr_4157 = -1;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            var _local_3:RoomWidgetPetPackageUpdateEvent = new RoomWidgetPetPackageUpdateEvent("RWOPPUE_OPEN_PET_PACKAGE_UPDATE_PET_IMAGE", _SafeStr_4157, _arg_2, -1, null, -1);
            _container.events.dispatchEvent(_local_3);
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        private function getPetImage(_arg_1:_SafeStr_1552):BitmapData
        {
            var _local_2:uint;
            var _local_3:uint;
            var _local_4:* = null;
            if (_arg_1 != null)
            {
                _local_2 = parseInt(_arg_1.color, 16);
                _local_3 = 0;
                _local_4 = _container.roomEngine.getPetImage(_arg_1.typeId, _arg_1.paletteId, _local_2, new Vector3d(90), 64, this, true, _local_3);
                if (_local_4 != null)
                {
                    return (_local_4.data);
                };
            };
            return (null);
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_1552 = "_-JF" (String#13053, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)


