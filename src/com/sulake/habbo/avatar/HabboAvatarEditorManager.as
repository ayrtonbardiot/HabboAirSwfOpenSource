// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.HabboAvatarEditorManager

package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.inventory._SafeStr_1708;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.ui.IRoomUI;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDCoreWindowManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboInventory;
    import com.sulake.iid.IIDCoreLocalizationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboRoomUI;
    import __AS3__.vec.Vector;
    import flash.events.Event;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.avatar.enum._SafeStr_3191;
    import com.sulake.habbo.ui.IRoomDesktop;
    import com.sulake.iid.*;

    public class HabboAvatarEditorManager extends _SafeStr_20 implements _SafeStr_1758, ILinkEventTracker 
    {

        public static const _SafeStr_8303:uint = 1;
        public static const _SafeStr_8304:uint = 2;
        public static const _SafeStr_8305:uint = 3;
        private static const GENERIC:String = "generic";

        private var _windowManager:_SafeStr_1695;
        private var _avatarRenderManager:_SafeStr_1701;
        private var _inventory:_SafeStr_1708;
        private var _localization:_SafeStr_18;
        private var _communication:_SafeStr_25;
        private var _catalog:IHabboCatalog;
        private var _sessionData:ISessionDataManager;
        private var _roomUI:IRoomUI;
        private var _SafeStr_3914:AvatarEditorMessageHandler;
        private var _editors:_SafeStr_24;

        public function HabboAvatarEditorManager(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _editors = new _SafeStr_24();
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDCoreWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:_SafeStr_25):void
            {
                _communication = _arg_1;
            }, ((flags & 0x03) == 0)), new ComponentDependency(new IIDAvatarRenderManager(), function (_arg_1:_SafeStr_1701):void
            {
                _avatarRenderManager = _arg_1;
            }, true, [{
                "type":"AVATAR_RENDER_READY",
                "callback":onAvatarRendererReady
            }]), new ComponentDependency(new IIDHabboInventory(), function (_arg_1:_SafeStr_1708):void
            {
                _inventory = _arg_1;
            }, ((flags & 0x01) == 0), []), new ComponentDependency(new IIDCoreLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localization = _arg_1;
            }), new ComponentDependency(new IIDHabboConfigurationManager(), null, true, [{
                "type":"complete",
                "callback":onConfigurationComplete
            }]), new ComponentDependency(new IIDHabboCatalog(), function (_arg_1:IHabboCatalog):void
            {
                _catalog = _arg_1;
            }, ((flags & 0x02) == 0)), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionData = _arg_1;
            }), new ComponentDependency(new IIDHabboRoomUI(), function (_arg_1:IRoomUI):void
            {
                _roomUI = _arg_1;
            }, false)]));
        }

        private function onConfigurationComplete(_arg_1:Event):void
        {
        }

        override protected function initComponent():void
        {
            context.addLinkEventTracker(this);
            if (_communication)
            {
                _SafeStr_3914 = new AvatarEditorMessageHandler(this, _communication);
            };
        }

        override public function dispose():void
        {
            if (_editors)
            {
                for each (var _local_1:HabboAvatarEditor in _editors)
                {
                    _local_1.dispose();
                    _local_1 = null;
                };
                _editors = null;
            };
            if (_SafeStr_3914 != null)
            {
                _SafeStr_3914.dispose();
                _SafeStr_3914 = null;
            };
            super.dispose();
        }

        public function openEditor(_arg_1:uint, _arg_2:_SafeStr_3223, _arg_3:Array=null, _arg_4:Boolean=false, _arg_5:String=null, _arg_6:String="generic"):_SafeStr_3263
        {
            var _local_7:HabboAvatarEditor = _editors.getValue(_arg_1);
            if (!_local_7)
            {
                _local_7 = new HabboAvatarEditor(_arg_1, this);
                _editors.add(_arg_1, _local_7);
            };
            return (_local_7.openWindow(_arg_2, _arg_3, _arg_4, _arg_5, _arg_6));
        }

        public function embedEditorToContext(_arg_1:uint, _arg_2:_SafeStr_3133, _arg_3:_SafeStr_3223=null, _arg_4:Array=null, _arg_5:Boolean=false, _arg_6:Boolean=false):Boolean
        {
            var _local_7:HabboAvatarEditor = _editors.getValue(_arg_1);
            if (_local_7)
            {
                _local_7.dispose();
            };
            _local_7 = new HabboAvatarEditor(_arg_1, this, _arg_6);
            _editors.add(_arg_1, _local_7);
            _local_7.embedToContext(_arg_2, _arg_3, _arg_4, _arg_5);
            return (true);
        }

        public function loadAvatarInEditor(_arg_1:uint, _arg_2:String, _arg_3:String, _arg_4:int=0):void
        {
            var _local_5:HabboAvatarEditor = (_editors.getValue(_arg_1) as HabboAvatarEditor);
            if (_local_5)
            {
                return (_local_5.loadAvatarInEditor(_arg_2, _arg_3, _arg_4));
            };
        }

        public function loadOwnAvatarInEditor(_arg_1:uint):void
        {
            var _local_2:HabboAvatarEditor = (_editors.getValue(_arg_1) as HabboAvatarEditor);
            if (_local_2)
            {
                if (_local_2.hasNftOutfit())
                {
                    return (_local_2.loadFallbackFigure());
                };
                return (_local_2.loadAvatarInEditor(sessionData.figure, sessionData.gender, sessionData.clubLevel));
            };
        }

        public function close(_arg_1:uint):void
        {
            if (!_editors)
            {
                return;
            };
            var _local_2:HabboAvatarEditor = (_editors.getValue(_arg_1) as HabboAvatarEditor);
            if (!_local_2)
            {
                return;
            };
            if (!_SafeStr_3191.isDevelopmentEditor(_arg_1))
            {
                _local_2.figureData.avatarEffectType = inventory.getLastActivatedEffect();
            };
            switch (_arg_1)
            {
                case 0:
                    _local_2.hide();
                    return;
                case 1:
                    _local_2.hide();
                    _local_2.dispose();
                    _editors.remove(_arg_1);
                    return;
                case 2:
                    return;
                default:
                    _local_2.dispose();
                    _editors.remove(_arg_1);
            };
        }

        public function getEditor(_arg_1:uint):HabboAvatarEditor
        {
            return (_editors.getValue(_arg_1) as HabboAvatarEditor);
        }

        public function get localization():_SafeStr_18
        {
            return (_localization);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get avatarRenderManager():_SafeStr_1701
        {
            return (_avatarRenderManager);
        }

        private function onAvatarRendererReady(_arg_1:Event=null):void
        {
            this.events.dispatchEvent(new Event("AVATAR_EDITOR_READY"));
        }

        public function get communication():_SafeStr_25
        {
            return (_communication);
        }

        public function get handler():AvatarEditorMessageHandler
        {
            return (_SafeStr_3914);
        }

        public function get catalog():IHabboCatalog
        {
            return (_catalog);
        }

        public function get sessionData():ISessionDataManager
        {
            return (_sessionData);
        }

        public function get inventory():_SafeStr_1708
        {
            return (_inventory);
        }

        public function get roomDesktop():IRoomDesktop
        {
            return (_roomUI.getDesktop("hard_coded_room_id"));
        }

        public function get linkPattern():String
        {
            return ("avatareditor/");
        }

        public function linkReceived(_arg_1:String):void
        {
            var _local_2:Array = _arg_1.split("/");
            if (_local_2.length < 2)
            {
                return;
            };
            switch (_local_2[1])
            {
                case "open":
                    openEditor(0, null, null, true);
                    loadOwnAvatarInEditor(0);
                    return;
                default:
                    return;
            };
        }


    }
}//package com.sulake.habbo.avatar

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1708 = "_-Nb" (String#2308, DoABC#4)
// _SafeStr_1758 = "_-Y5" (String#3968, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3191 = "_-H1g" (String#22455, DoABC#4)
// _SafeStr_3223 = "_-Z1v" (String#6974, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_8303 = "_-H1u" (String#39666, DoABC#4)
// _SafeStr_8304 = "_-F1A" (String#30711, DoABC#4)
// _SafeStr_8305 = "_-CT" (String#22470, DoABC#4)


