// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents

package com.sulake.habbo.roomevents
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.iid.IIDSessionDataManager;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.room._SafeStr_1689;
    import com.sulake.habbo.room.ISelectedRoomObjectData;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.habbo.session.events.RoomSessionEvent;

    public class HabboUserDefinedRoomEvents extends _SafeStr_20 implements IHabboUserDefinedRoomEvents 
    {

        private var _windowManager:_SafeStr_1695;
        private var _communication:_SafeStr_25;
        private var _localization:_SafeStr_18;
        private var _SafeStr_3929:UserDefinedRoomEventsCtrl;
        private var _SafeStr_3757:_SafeStr_3118;
        private var _roomEngine:IRoomEngine;
        private var _roomSession:IRoomSession;
        private var _sessionDataManager:ISessionDataManager;
        private var _userName:String;

        public function HabboUserDefinedRoomEvents(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_3929 = new UserDefinedRoomEventsCtrl(this);
        }

        public function get communication():_SafeStr_25
        {
            return (_communication);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get localization():_SafeStr_18
        {
            return (_localization);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:_SafeStr_25):void
            {
                _communication = _arg_1;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localization = _arg_1;
            }), new ComponentDependency(new IIDRoomEngine(), function (_arg_1:IRoomEngine):void
            {
                _roomEngine = _arg_1;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), null, false, [{
                "type":"RSE_CREATED",
                "callback":roomSessionStateEventHandler
            }, {
                "type":"RSE_STARTED",
                "callback":roomSessionStateEventHandler
            }, {
                "type":"RSE_ENDED",
                "callback":roomSessionStateEventHandler
            }]), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            _SafeStr_3757 = new _SafeStr_3118(this);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_SafeStr_3757 != null)
            {
                _SafeStr_3757.dispose();
                _SafeStr_3757 = null;
            };
            super.dispose();
        }

        public function stuffSelected(_arg_1:int, _arg_2:String):void
        {
            var _local_3:ISelectedRoomObjectData = (_roomEngine as _SafeStr_1689).getPlacedObjectData(roomId);
            if (((_local_3) && (_local_3.id == -(_arg_1))))
            {
                (_roomEngine as _SafeStr_1689).setPlacedObjectData(roomId, null);
                return;
            };
            _SafeStr_3929.stuffSelected(_arg_1, _arg_2);
        }

        public function send(_arg_1:IMessageComposer, _arg_2:Boolean=false):void
        {
            _communication.connection.send(_arg_1);
        }

        public function getXmlWindow(_arg_1:String):_SafeStr_3109
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_3:_SafeStr_3109;
            try
            {
                _local_4 = assets.getAssetByName((_arg_1 + "_xml"));
                _local_2 = XmlAsset(_local_4);
                _local_3 = _windowManager.buildFromXML(XML(_local_2.content));
            }
            catch(e:Error)
            {
            };
            return (_local_3);
        }

        public function refreshButton(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:Boolean, _arg_4:Function, _arg_5:int, _arg_6:String=null):void
        {
            if (!_arg_6)
            {
                _arg_6 = _arg_2;
            };
            var _local_7:_SafeStr_3264 = (_arg_1.findChildByName(_arg_2) as _SafeStr_3264);
            if (!_arg_3)
            {
                _local_7.visible = false;
            }
            else
            {
                prepareButton(_local_7, _arg_6, _arg_4, _arg_5);
                _local_7.visible = true;
            };
        }

        private function prepareButton(_arg_1:_SafeStr_3264, _arg_2:String, _arg_3:Function, _arg_4:int):void
        {
            _arg_1.id = _arg_4;
            _arg_1.procedure = _arg_3;
            if (_arg_1.bitmap != null)
            {
                return;
            };
            _arg_1.bitmap = getButtonImage(_arg_2);
            _arg_1.width = _arg_1.bitmap.width;
            _arg_1.height = _arg_1.bitmap.height;
        }

        public function getButtonImage(_arg_1:String, _arg_2:String="_png"):BitmapData
        {
            var _local_4:String = (_arg_1 + _arg_2);
            var _local_6:IAsset = assets.getAssetByName(_local_4);
            var _local_5:BitmapDataAsset = BitmapDataAsset(_local_6);
            var _local_3:BitmapData = BitmapData(_local_5.content);
            return (_local_3.clone());
        }

        public function get userDefinedRoomEventsCtrl():UserDefinedRoomEventsCtrl
        {
            return (_SafeStr_3929);
        }

        public function get roomEngine():IRoomEngine
        {
            return (_roomEngine);
        }

        private function roomSessionStateEventHandler(_arg_1:RoomSessionEvent):void
        {
            if (_roomEngine == null)
            {
                return;
            };
            switch (_arg_1.type)
            {
                case "RSE_CREATED":
                case "RSE_STARTED":
                case "RSE_ENDED":
                    _roomSession = _arg_1.session;
                    return;
            };
        }

        public function get roomId():int
        {
            return ((_roomSession) ? _roomSession.roomId : 0);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function set userName(_arg_1:String):void
        {
            _userName = _arg_1;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }


    }
}//package com.sulake.habbo.roomevents

// _SafeStr_1689 = "_-018" (String#7789, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3118 = "_-wi" (String#2138, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3757 = "_-iH" (String#1838, DoABC#4)
// _SafeStr_3929 = "_-11" (String#15248, DoABC#4)


