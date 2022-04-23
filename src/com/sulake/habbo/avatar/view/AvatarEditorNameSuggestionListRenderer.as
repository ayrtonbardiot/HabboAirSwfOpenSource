// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.view.AvatarEditorNameSuggestionListRenderer

package com.sulake.habbo.avatar.view
{
    import com.sulake.habbo.avatar.HabboAvatarEditorManager;
    import flash.geom.Rectangle;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextWindow;

    public class AvatarEditorNameSuggestionListRenderer 
    {

        private const MARGIN_X:int = 5;
        private const MARGIN_Y:int = 5;

        private var _SafeStr_4144:HabboAvatarEditorManager;
        private var _offsetX:int;
        private var _offsetY:int;
        private var _SafeStr_8302:int = 0;
        private var _SafeStr_6389:Rectangle = null;

        public function AvatarEditorNameSuggestionListRenderer(_arg_1:HabboAvatarEditorManager)
        {
            this._SafeStr_4144 = _arg_1;
        }

        public function dispose():void
        {
            _SafeStr_4144 = null;
        }

        public function render(_arg_1:Array, _arg_2:_SafeStr_3133):int
        {
            var _local_7:* = null;
            var _local_4:* = null;
            var _local_5:int;
            while (_arg_2.numChildren > 0)
            {
                _local_7 = _arg_2.removeChildAt(0);
                _local_7.dispose();
            };
            _arg_2.parent.invalidate();
            _SafeStr_8302 = 0;
            _offsetX = 0;
            _offsetY = 0;
            _SafeStr_6389 = _arg_2.rectangle;
            _SafeStr_6389.height = 150;
            _local_5 = 0;
            while (_local_5 < _arg_1.length)
            {
                _local_4 = createItem((_arg_1[_local_5] as String));
                if (fit(_local_4))
                {
                    _arg_2.addChild(_local_4);
                }
                else
                {
                    _local_4.dispose();
                };
                _local_5++;
            };
            var _local_6:int = _arg_2.numChildren;
            if (_local_6 == 0)
            {
                return (0);
            };
            var _local_3:_SafeStr_3109 = _arg_2.getChildAt((_arg_2.numChildren - 1));
            return (_local_3.bottom);
        }

        private function fit(_arg_1:_SafeStr_3109):Boolean
        {
            if (((_arg_1.width > _SafeStr_6389.width) || (_arg_1.width < 2)))
            {
                return (false);
            };
            if ((_offsetY + _arg_1.height) > _SafeStr_6389.height)
            {
                return (false);
            };
            if ((_offsetX + _arg_1.width) > _SafeStr_6389.width)
            {
                _offsetX = 0;
                _offsetY = (_offsetY + (_arg_1.height + 5));
                return (fit(_arg_1));
            };
            _arg_1.x = (_arg_1.x + _offsetX);
            _arg_1.y = (_arg_1.y + _offsetY);
            _offsetX = (_offsetX + (_arg_1.width + 5));
            return (true);
        }

        private function createItem(_arg_1:String):ITextWindow
        {
            var _local_2:ITextWindow = (_SafeStr_4144.windowManager.buildFromXML(XML(HabboAvatarEditorCom.avatar_editor_name_change_item)) as ITextWindow);
            if (_local_2 == null)
            {
                return (null);
            };
            _local_2.text = _arg_1;
            return (_local_2);
        }


    }
}//package com.sulake.habbo.avatar.view

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_6389 = "_-C1U" (String#2446, DoABC#4)
// _SafeStr_8302 = "_-b1U" (String#8174, DoABC#4)


