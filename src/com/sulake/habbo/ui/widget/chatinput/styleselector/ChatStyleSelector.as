// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleSelector

package com.sulake.habbo.ui.widget.chatinput.styleselector
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.ui.widget.chatinput.RoomChatInputView;
    import com.sulake.core.window._SafeStr_3133;
    import __AS3__.vec.Vector;
    import com.sulake.core.window._SafeStr_3109;
    import flash.display.Shape;
    import com.sulake.habbo.session.ISessionDataManager;
    import flash.display.BitmapData;
    import com.sulake.habbo.freeflowchat.style._SafeStr_3366;
    import flash.display.Sprite;
    import com.sulake.core.window.components._SafeStr_3189;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.events._SafeStr_3116;

    public class ChatStyleSelector implements _SafeStr_13 
    {

        private static const GRID_SPACING:int = 1;
        private static const MAX_GRID_COLUMNS:int = 3;

        private static var _selected:ChatStyleGridEntry = null;
        private static var _styleRequiresUpdate:Boolean = false;

        private var _SafeStr_6699:RoomChatInputView;
        private var _container:_SafeStr_3133;
        private var _SafeStr_5837:ChatStyleGridView;
        private var _SafeStr_5093:Vector.<ChatStyleGridEntry> = new Vector.<ChatStyleGridEntry>();
        private var _SafeStr_6701:_SafeStr_3109;
        private var _SafeStr_6700:Shape;

        public function ChatStyleSelector(_arg_1:RoomChatInputView, _arg_2:_SafeStr_3133, _arg_3:ISessionDataManager)
        {
            _SafeStr_6699 = _arg_1;
            _SafeStr_5837 = new ChatStyleGridView(this, _SafeStr_6699.sessionDataManager);
            _SafeStr_6701 = _arg_1.widget.windowManager.buildFromXML((_arg_1.widget.assets.getAssetByName("chatinput_chatstyle_template_xml").content as XML));
            _container = _arg_2;
            _container.procedure = windowProc;
            _SafeStr_6699.chatStyleMenuContainer.addChild(_SafeStr_5837.window);
            _SafeStr_5837.window.x = 0;
            _SafeStr_5837.window.y = 0;
        }

        public function dispose():void
        {
            while (_SafeStr_5093.length > 1)
            {
                _SafeStr_5093.pop();
            };
            _SafeStr_5093 = null;
            _SafeStr_5837.dispose();
            _SafeStr_5837 = null;
            if (((_SafeStr_6700) && (_SafeStr_6700.parent)))
            {
                _SafeStr_6700.parent.removeChild(_SafeStr_6700);
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_5837 == null);
        }

        public function get chatInputView():RoomChatInputView
        {
            return (_SafeStr_6699);
        }

        public function addItem(_arg_1:int, _arg_2:BitmapData):void
        {
            _SafeStr_5093.push(new ChatStyleGridEntry(_arg_1, _arg_2));
            var _local_3:_SafeStr_3133 = getGridItemWindowWrapper(_arg_2);
            _SafeStr_5837.grid.addGridItem(_local_3);
            _local_3.findChildByName("background_color").visible = false;
        }

        public function get selectedStyleId():int
        {
            if (((_styleRequiresUpdate) && (selected)))
            {
                _styleRequiresUpdate = false;
                return (selected.id);
            };
            return (-1);
        }

        public function get selectedStyleBitmap():BitmapData
        {
            if (selected)
            {
                return (selected.bitmap);
            };
            return (null);
        }

        public function initSelection():void
        {
            selected = selected;
            _styleRequiresUpdate = false;
        }

        public function set gridColumns(_arg_1:int):void
        {
            _arg_1 = Math.min(_arg_1, 3);
            var _local_2:int = (((_arg_1 - 1) * (_SafeStr_6701.width + 1)) + _SafeStr_6701.width);
            if (_arg_1 > 1)
            {
                _SafeStr_5837.grid.width = _local_2;
            }
            else
            {
                _SafeStr_5837.grid.width = (_SafeStr_6701.width + 16);
            };
        }

        private function set selected(_arg_1:ChatStyleGridEntry):void
        {
            _selected = _arg_1;
            _styleRequiresUpdate = true;
            var _local_4:_SafeStr_3366 = _SafeStr_6699.widget.roomUi.chatStyleLibrary.getStyle(_arg_1.id);
            if (_SafeStr_6699.window.findChildByName("chat_bg_preview") == null)
            {
                return;
            };
            var _local_2:Sprite = _local_4.getNewBackgroundSprite(0xFFFFFF);
            var _local_3:_SafeStr_3189 = _SafeStr_3189(_SafeStr_6699.window.findChildByName("chat_bg_preview"));
            _local_2.width = (_local_3.width + _local_4.overlap.width);
            _local_2.height = ((_local_3.height + _local_4.overlap.y) + _local_4.overlap.height);
            _local_2.y = (_local_2.y - _local_4.overlap.y);
            if (!_SafeStr_6700)
            {
                _SafeStr_6700 = new Shape();
            }
            else
            {
                _SafeStr_6700.graphics.clear();
            };
            _SafeStr_6700.graphics.beginFill(0xFF0000);
            _SafeStr_6700.graphics.drawRect(0, 0, (_local_2.width - 28), _local_2.height);
            _local_3.setDisplayObject(_local_2);
            if (_local_2.parent)
            {
                _local_2.parent.addChild(_SafeStr_6700);
                _SafeStr_6700.x = (_local_2.x + 28);
                _SafeStr_6700.y = _local_2.y;
                _local_2.mask = _SafeStr_6700;
            };
            _SafeStr_6699.setInputFieldColor((_local_4.textFormat.color as uint));
        }

        private function get selected():ChatStyleGridEntry
        {
            if (_selected == null)
            {
                _selected = _SafeStr_5093[(_SafeStr_5093.length - 1)];
            };
            return (_selected);
        }

        private function getGridItemWindowWrapper(_arg_1:BitmapData):_SafeStr_3133
        {
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_SafeStr_6701.clone());
            var _local_3:_SafeStr_3264 = _SafeStr_3264(_local_2.findChildByName("bubble_preview"));
            _local_3.bitmap = _arg_1;
            _local_3.center();
            _local_2.procedure = gridItemWindowProc;
            return (_local_2);
        }

        public function alignMenuToSelector():void
        {
            if (_SafeStr_5837.window.visible)
            {
                _SafeStr_5837.alignToSelector(_container);
            };
        }

        private function windowProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_5837.window.visible = (!(_SafeStr_5837.window.visible));
                alignMenuToSelector();
            };
        }

        private function gridItemWindowProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:int;
            if (_arg_1.type == "WME_CLICK")
            {
                _local_3 = _SafeStr_5837.grid.getGridItemIndex(_arg_2);
                showBackgroundOnlyForItem(_arg_2);
                selected = _SafeStr_5093[_local_3];
                _SafeStr_5837.window.visible = false;
            };
            if (_arg_1.type == "WME_OVER")
            {
                _SafeStr_3133(_arg_2).findChildByName("background_color").color = 4291875024;
            };
            if (_arg_1.type == "WME_OUT")
            {
                _SafeStr_3133(_arg_2).findChildByName("background_color").color = 0xFFFFFFFF;
            };
        }

        private function showBackgroundOnlyForItem(_arg_1:_SafeStr_3109):void
        {
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < _SafeStr_5837.grid.numGridItems)
            {
                _SafeStr_3133(_SafeStr_5837.grid.getGridItemAt(_local_2)).findChildByName("background_color").visible = false;
                _local_2++;
            };
            _SafeStr_3133(_arg_1).findChildByName("background_color").visible = true;
        }


    }
}//package com.sulake.habbo.ui.widget.chatinput.styleselector

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3366 = "_-ls" (String#8795, DoABC#4)
// _SafeStr_5093 = "_-Pc" (String#1317, DoABC#4)
// _SafeStr_5837 = "_-Xg" (String#3116, DoABC#4)
// _SafeStr_6699 = "_-hx" (String#7203, DoABC#4)
// _SafeStr_6700 = "_-v1Q" (String#5101, DoABC#4)
// _SafeStr_6701 = "_-QY" (String#10760, DoABC#4)


