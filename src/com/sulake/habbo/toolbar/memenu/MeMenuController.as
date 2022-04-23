﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.toolbar.memenu.MeMenuController

package com.sulake.habbo.toolbar.memenu
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.habbo.toolbar.ToolbarView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import _-XO._SafeStr_313;
    import com.sulake.habbo.utils.HabboWebTools;
    import _-f1P._SafeStr_953;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;

    public class MeMenuController implements _SafeStr_13 
    {

        public static const USE_GUIDE_TOOL:String = "USE_GUIDE_TOOL";

        private var _toolbar:HabboToolbar;
        private var _SafeStr_4389:ToolbarView;
        private var _window:_SafeStr_3133;
        private var _SafeStr_5512:MeMenuIconLoader;
        private var _SafeStr_6943:Boolean;
        private var _SafeStr_5511:MeMenuSettingsMenuView;
        private var _unseenItemCounters:_SafeStr_24;

        public function MeMenuController(_arg_1:HabboToolbar, _arg_2:ToolbarView)
        {
            _unseenItemCounters = new _SafeStr_24();
            _toolbar = _arg_1;
            _SafeStr_4389 = _arg_2;
            _toolbar.events.addEventListener("HTE_TOOLBAR_CLICK", onToolbarClick);
            var _local_3:XmlAsset = (_toolbar.assets.getAssetByName("me_menu_view_xml") as XmlAsset);
            _window = (_toolbar.windowManager.buildFromXML((_local_3.content as XML), 2) as _SafeStr_3133);
            _SafeStr_5512 = new MeMenuIconLoader(_toolbar);
            _window.visible = false;
            _window.procedure = windowProcedure;
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_6:* = null;
            if ((_arg_2 is IRegionWindow))
            {
                _local_5 = (_arg_2 as IRegionWindow);
                switch (_arg_1.type)
                {
                    case "WME_OVER":
                        _local_3 = (_local_5.findChildByName((_arg_2.name + "_icon")) as IStaticBitmapWrapperWindow);
                        if (_local_3 != null)
                        {
                            _local_3.assetUri = (("toolbar_memenu_" + _arg_2.name) + "_color");
                        };
                        return;
                    case "WME_OUT":
                        _local_3 = (_local_5.findChildByName((_arg_2.name + "_icon")) as IStaticBitmapWrapperWindow);
                        if (_local_3 != null)
                        {
                            _local_3.assetUri = (("toolbar_memenu_" + _arg_2.name) + "_white");
                        };
                        return;
                    case "WME_CLICK":
                        _window.visible = false;
                        switch (_arg_2.name)
                        {
                            case "profile":
                                _toolbar.connection.send(new _SafeStr_313(_toolbar.sessionDataManager.userId));
                                break;
                            case "minimail":
                                HabboWebTools.openMinimail("#mail/inbox/");
                                break;
                            case "rooms":
                                _local_4 = _toolbar.navigator;
                                if (_local_4 != null)
                                {
                                    _local_4.showOwnRooms();
                                };
                                break;
                            case "talents":
                                _local_6 = _toolbar.sessionDataManager.currentTalentTrack;
                                _toolbar.connection.send(new _SafeStr_953(_local_6));
                                break;
                            case "settings":
                                _SafeStr_5511 = new MeMenuSettingsMenuView();
                                _SafeStr_5511.init(this, _SafeStr_4389);
                                break;
                            case "achievements":
                                _toolbar.questEngine.showAchievements();
                                break;
                            case "guide":
                                _toolbar.toggleWindowVisibility("GUIDE");
                                break;
                            case "clothes":
                                _toolbar.context.createLinkEvent("avatareditor/open");
                        };
                        return;
                };
            };
        }

        private function onToolbarClick(_arg_1:HabboToolbarEvent):void
        {
            if (_SafeStr_6943)
            {
                return;
            };
            if (_arg_1.iconId == "HTIE_ICON_MEMENU")
            {
                toggleVisibility();
            }
            else
            {
                _window.visible = false;
                if (_SafeStr_5511 != null)
                {
                    _SafeStr_5511.dispose();
                    _SafeStr_5511 = null;
                };
            };
        }

        private function setGuideToolVisibility(_arg_1:Boolean):void
        {
            _window.findChildByName("guide").visible = _arg_1;
            _window.height = ((_arg_1) ? (_window.findChildByName("guide").bottom + 5) : (_window.findChildByName("achievements").bottom + 5));
        }

        public function toggleVisibility():void
        {
            var _local_1:Boolean;
            if (_SafeStr_5511 != null)
            {
                _SafeStr_5511.dispose();
                _SafeStr_5511 = null;
            };
            _window.visible = (!(_window.visible));
            if (_window.visible)
            {
                if (!toolbar.getBoolean("talent.track.enabled"))
                {
                    _window.findChildByName("guide").rectangle = _window.findChildByName("talents").rectangle;
                    _window.findChildByName("talents").visible = false;
                };
                if (_toolbar.getBoolean("guides.enabled"))
                {
                    _local_1 = _toolbar.sessionDataManager.isPerkAllowed("USE_GUIDE_TOOL");
                    setGuideToolVisibility(_local_1);
                };
            };
            reposition();
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_SafeStr_5511 != null)
            {
                _SafeStr_5511.dispose();
                _SafeStr_5511 = null;
            };
            _SafeStr_5512.dispose();
            _SafeStr_5512 = null;
            _toolbar.events.removeEventListener("HTE_TOOLBAR_CLICK", onToolbarClick);
            _SafeStr_4389 = null;
            _toolbar = null;
        }

        public function get disposed():Boolean
        {
            return (_toolbar == null);
        }

        public function get toolbar():HabboToolbar
        {
            return (_toolbar);
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        public function reposition():void
        {
            _window.x = (_SafeStr_4389.window.width + 10);
            _window.y = (_SafeStr_4389.window.bottom - _window.height);
        }

        public function getUnseenItemCounter(_arg_1:String):_SafeStr_3133
        {
            var _local_2:* = null;
            var _local_4:* = _arg_1;
            if (!_local_4)
            {
                _SafeStr_14.log(("[Toolbar] Unknown icon type for unseen item counter for iconId: " + _arg_1));
            };
            var _local_3:_SafeStr_3133 = (_unseenItemCounters.getValue(_arg_1) as _SafeStr_3133);
            if (!_local_3)
            {
                _local_3 = _toolbar.windowManager.createUnseenItemCounter();
                _local_2 = (_window.findChildByName(_local_4) as _SafeStr_3133);
                if (_local_2)
                {
                    _local_2.addChild(_local_3);
                    _local_3.x = ((_local_2.width - _local_3.width) - 5);
                    _local_3.y = 5;
                    _unseenItemCounters.add(_arg_1, _local_3);
                };
            };
            return (_local_3);
        }

        public function set achievementCount(_arg_1:int):void
        {
            setUnseenItemCount("achievements", _arg_1);
        }

        public function set minimailCount(_arg_1:int):void
        {
            setUnseenItemCount("minimail", _arg_1);
        }

        public function set newUiEnabled(_arg_1:Boolean):void
        {
            _SafeStr_6943 = _arg_1;
        }

        public function setUnseenItemCount(_arg_1:String, _arg_2:int):void
        {
            var _local_3:_SafeStr_3133 = getUnseenItemCounter(_arg_1);
            if (!_local_3)
            {
                return;
            };
            if (_arg_2 < 0)
            {
                _local_3.visible = true;
                _local_3.findChildByName("count").caption = " ";
            }
            else
            {
                if (_arg_2 > 0)
                {
                    _local_3.visible = true;
                    _local_3.findChildByName("count").caption = _arg_2.toString();
                }
                else
                {
                    _local_3.visible = false;
                };
            };
        }


    }
}//package com.sulake.habbo.toolbar.memenu

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4389 = "_-3p" (String#1625, DoABC#4)
// _SafeStr_5511 = "_-32S" (String#2889, DoABC#4)
// _SafeStr_5512 = "_-B1Z" (String#6168, DoABC#4)
// _SafeStr_6943 = "_-A1C" (String#18331, DoABC#4)
// _SafeStr_953 = "_-a1w" (String#3282, DoABC#4)


