// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.toolbar.extensions.SettingsExtension

package com.sulake.habbo.toolbar.extensions
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.core.window._SafeStr_3133;
    import __AS3__.vec.Vector;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.toolbar.extensions.settings.SoundSettingsView;
    import com.sulake.habbo.toolbar.extensions.settings.OtherSettingsView;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events._SafeStr_3116;

    public class SettingsExtension implements _SafeStr_13 
    {

        private static const SPACING:int = 3;
        private static const PADDING:int = 7;

        private var _toolbar:HabboToolbar;
        private var _window:_SafeStr_3133;
        private var _buttons:Vector.<_SafeStr_3109> = new Vector.<_SafeStr_3109>();
        private var _disposed:Boolean = false;

        public function SettingsExtension(_arg_1:HabboToolbar)
        {
            _toolbar = _arg_1;
            _window = (_toolbar.windowManager.buildFromXML((_arg_1.assets.getAssetByName("settings_xml").content as XML)) as _SafeStr_3133);
            _window.procedure = windowProcedure;
            addButton("avatar_settings", _toolbar.localization.getLocalization("widget.memenu.settings.character", "avatar settings"));
            addButton("sound", _toolbar.localization.getLocalization("widget.memenu.settings.audio", "sound settings"));
            addButton("chat", _toolbar.localization.getLocalization("widget.memenu.settings.other", "other settings"));
            _arg_1.extensionView.attachExtension("settings", _window, 1);
            _window.visible = false;
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _toolbar = null;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        private function addButton(_arg_1:String, _arg_2:String):void
        {
            var _local_3:_SafeStr_3133 = (_toolbar.windowManager.buildFromXML((_toolbar.assets.getAssetByName("setting_category_xml").content as XML)) as _SafeStr_3133);
            _window.addChild(_local_3);
            _local_3.findChildByName("button_label").caption = _arg_2;
            if (_buttons.length > 0)
            {
                _local_3.y = (_buttons[(_buttons.length - 1)].bottom + 3);
            }
            else
            {
                _local_3.y = 7;
            };
            _local_3.x = 7;
            _local_3.name = _arg_1;
            _local_3.procedure = windowProcedure;
            _buttons.push(_local_3);
            _window.height = (_buttons[(_buttons.length - 1)].bottom + 7);
        }

        private function openSoundSettingsWindow():void
        {
            var _local_2:SoundSettingsView = new SoundSettingsView(_toolbar);
            var _local_1:_SafeStr_3133 = _toolbar.windowManager.getDesktop(1);
            _local_1.addChild(_local_2.window);
            _local_2.window.x = ((_local_1.width - _local_2.window.width) - 200);
        }

        private function openChatSettingsWindow():void
        {
            var _local_2:OtherSettingsView = new OtherSettingsView(_toolbar);
            var _local_1:_SafeStr_3133 = _toolbar.windowManager.getDesktop(1);
            _local_1.addChild(_local_2.window);
            _local_2.window.x = ((_local_1.width - _local_2.window.width) - 200);
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "avatar_settings":
                    HabboWebTools.openAvatars();
                    _toolbar.toggleSettingVisibility();
                    return;
                case "sound":
                    openSoundSettingsWindow();
                    _toolbar.toggleSettingVisibility();
                    return;
                case "chat":
                    openChatSettingsWindow();
                    _toolbar.toggleSettingVisibility();
                    return;
            };
        }


    }
}//package com.sulake.habbo.toolbar.extensions

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


