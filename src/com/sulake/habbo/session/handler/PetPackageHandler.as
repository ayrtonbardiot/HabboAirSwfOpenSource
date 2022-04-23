// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.handler.PetPackageHandler

package com.sulake.habbo.session.handler
{
    import _-81g._SafeStr_689;
    import _-81g._SafeStr_770;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import _-z1k._SafeStr_1509;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.events.RoomSessionPetPackageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-z1k._SafeStr_1095;

    public class PetPackageHandler extends BaseHandler 
    {

        public function PetPackageHandler(_arg_1:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(_arg_1, _arg_2);
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addMessageEvent(new _SafeStr_689(onOpenPetPackageRequested));
            _arg_1.addMessageEvent(new _SafeStr_770(onOpenPetPackageResult));
        }

        private function onOpenPetPackageRequested(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1509 = (_arg_1 as _SafeStr_689).getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            if (((listener) && (listener.events)))
            {
                listener.events.dispatchEvent(new RoomSessionPetPackageEvent("RSOPPE_OPEN_PET_PACKAGE_REQUESTED", _local_3, _local_2.objectId, _local_2.figureData, 0, null));
            };
        }

        private function onOpenPetPackageResult(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1095 = (_arg_1 as _SafeStr_770).getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            if (((listener) && (listener.events)))
            {
                listener.events.dispatchEvent(new RoomSessionPetPackageEvent("RSOPPE_OPEN_PET_PACKAGE_RESULT", _local_3, _local_2.objectId, null, _local_2.nameValidationStatus, _local_2.nameValidationInfo));
            };
        }


    }
}//package com.sulake.habbo.session.handler

// _SafeStr_1095 = "_-8D" (String#38507, DoABC#4)
// _SafeStr_1509 = "_-M1J" (String#39009, DoABC#4)
// _SafeStr_3937 = "_-jF" (String#1979, DoABC#4)
// _SafeStr_689 = "_-6U" (String#24796, DoABC#4)
// _SafeStr_770 = "_-d1r" (String#24686, DoABC#4)


