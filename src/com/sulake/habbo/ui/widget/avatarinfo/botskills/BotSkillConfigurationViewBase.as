// by nota

//com.sulake.habbo.ui.widget.avatarinfo.botskills.BotSkillConfigurationViewBase

package com.sulake.habbo.ui.widget.avatarinfo.botskills
{
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
    import com.sulake.core.window._SafeStr_3133;
    import _-u7._SafeStr_1019;
    import _-T1V._SafeStr_396;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class BotSkillConfigurationViewBase implements _SafeStr_3297 
    {

        private var _SafeStr_5665:IMessageEvent;
        protected var _SafeStr_4981:AvatarInfoWidget;
        protected var _window:_SafeStr_3133;
        protected var _SafeStr_5666:int;

        public function BotSkillConfigurationViewBase(_arg_1:AvatarInfoWidget)
        {
            _SafeStr_4981 = _arg_1;
        }

        public function dispose():void
        {
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_4981)
            {
                if (((_SafeStr_4981.handler.container.connection) && (_SafeStr_5665)))
                {
                    _SafeStr_4981.handler.container.connection.removeMessageEvent(_SafeStr_5665);
                    _SafeStr_5665 = null;
                };
                _SafeStr_4981 = null;
            };
            _SafeStr_5666 = -1;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4981 == null);
        }

        public function open(_arg_1:int, _arg_2:Point=null):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            _SafeStr_5666 = _arg_1;
            if (!_SafeStr_5665)
            {
                _SafeStr_5665 = new _SafeStr_1019(onBotCommandConfigurationEvent);
                _SafeStr_4981.handler.container.connection.addMessageEvent(_SafeStr_5665);
            };
            _SafeStr_4981.handler.container.connection.send(new _SafeStr_396(_SafeStr_5666, skillType));
            if (!_window)
            {
                _local_3 = (_SafeStr_4981.assets.getAssetByName(windowAssetName).content as XML);
                _window = (_SafeStr_4981.windowManager.buildFromXML(_local_3, 1) as _SafeStr_3133);
            };
            if (_arg_2)
            {
                _local_4 = _window.rectangle;
                _window.x = (_arg_2.x - (_local_4.width / 2));
                _window.y = (_arg_2.y - _local_4.height);
            };
            fitToScreen();
            _window.visible = true;
            deactivateInputs();
        }

        public function close():void
        {
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function parseConfiguration(_arg_1:String):void
        {
        }

        protected function deactivateInputs():void
        {
        }

        protected function get windowAssetName():String
        {
            return ("");
        }

        protected function get skillType():int
        {
            return (-1);
        }

        private function onBotCommandConfigurationEvent(_arg_1:_SafeStr_1019):void
        {
            if (((_arg_1.getParser().botId == _SafeStr_5666) && (_arg_1.getParser().commandId == skillType)))
            {
                parseConfiguration(_arg_1.getParser().data);
            };
        }

        private function fitToScreen():void
        {
            var _local_1:Rectangle = new Rectangle();
            _window.getGlobalRectangle(_local_1);
            if (_local_1.top < 0)
            {
                _window.y = (_window.y + -(_local_1.top));
            };
            if (_local_1.left < 0)
            {
                _window.x = (_window.x + -(_local_1.left));
            };
            if (_local_1.right > _window.desktop.width)
            {
                _window.x = (_window.x - (_local_1.right - _window.desktop.width));
            };
            if (_local_1.bottom > _window.desktop.height)
            {
                _window.y = (_window.y - (_local_1.bottom - _window.desktop.height));
            };
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo.botskills

// _SafeStr_1019 = "_-j1l" (String#24618, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3297 = "_-v1X" (String#14409, DoABC#4)
// _SafeStr_396 = "_-5i" (String#30925, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5665 = "_-C1v" (String#8685, DoABC#4)
// _SafeStr_5666 = "_-32J" (String#3660, DoABC#4)


