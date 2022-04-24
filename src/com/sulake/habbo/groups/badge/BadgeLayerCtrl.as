// by nota

//com.sulake.habbo.groups.badge.BadgeLayerCtrl

package com.sulake.habbo.groups.badge
{
    import com.sulake.habbo.groups.HabboGroupsManager;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.groups.ColorGridCtrl;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class BadgeLayerCtrl 
    {

        public static var BASE_LAYER_INDEX:int = 0;
        public static var PARENT_CONTAINER_NAME:String = "part_edit_list";

        private var _SafeStr_4144:HabboGroupsManager;
        private var _SafeStr_6570:BadgeEditorCtrl;
        private var _SafeStr_6661:int = 0;
        private var _SafeStr_6655:BadgeLayerOptions;
        private var _SafeStr_6656:_SafeStr_3133;
        private var _SafeStr_6662:ColorGridCtrl;
        private var _disposed:Boolean = false;
        private var _SafeStr_6663:BitmapData;
        private var _SafeStr_6657:_SafeStr_3264;
        private var _partSelectButton:_SafeStr_3122;
        private var _SafeStr_6658:_SafeStr_3133;
        private var _SafeStr_6659:_SafeStr_3264;
        private var _SafeStr_6660:_SafeStr_3264;

        public function BadgeLayerCtrl(_arg_1:HabboGroupsManager, _arg_2:BadgeEditorCtrl, _arg_3:int)
        {
            _SafeStr_4144 = _arg_1;
            _SafeStr_6570 = _arg_2;
            _SafeStr_6661 = _arg_3;
            _SafeStr_6655 = new BadgeLayerOptions();
            _SafeStr_6655.layerIndex = _arg_3;
            _SafeStr_6663 = _SafeStr_4144.getButtonImage("badge_part_add");
        }

        public function createWindow():void
        {
            if (_SafeStr_6656 != null)
            {
                return;
            };
            var _local_1:IItemListWindow = (_SafeStr_6570.partEditContainer.findChildByName(PARENT_CONTAINER_NAME) as IItemListWindow);
            _SafeStr_6656 = (_SafeStr_4144.getXmlWindow("badge_layer") as _SafeStr_3133);
            var _local_2:_SafeStr_3133 = (_SafeStr_6656.findChildByName("preview_container") as _SafeStr_3133);
            _SafeStr_6657 = (_local_2.findChildByName("part_preview") as _SafeStr_3264);
            _SafeStr_6657.bitmap = _SafeStr_4144.getButtonImage("badge_part_add");
            _partSelectButton = (_local_2.findChildByName("part_button") as _SafeStr_3122);
            _partSelectButton.procedure = onPartPreviewButtonClick;
            _SafeStr_6658 = (_SafeStr_6656.findChildByName("position_container") as _SafeStr_3133);
            _SafeStr_6659 = (_SafeStr_6658.findChildByName("position_picker") as _SafeStr_3264);
            _SafeStr_6659.bitmap = _SafeStr_4144.getButtonImage("position_picker");
            _SafeStr_6660 = (_SafeStr_6658.findChildByName("position_grid") as _SafeStr_3264);
            _SafeStr_6660.bitmap = _SafeStr_4144.getButtonImage("position_grid");
            if (_SafeStr_6661 == 0)
            {
                _SafeStr_6660.visible = false;
                _SafeStr_6659.visible = false;
            }
            else
            {
                _SafeStr_6660.procedure = onPositionGridClick;
            };
            _SafeStr_6662 = new ColorGridCtrl(_SafeStr_4144, onColorSelected);
            _SafeStr_6662.createAndAttach(_SafeStr_6656, "color_selector", _SafeStr_4144.guildEditorData.badgeColors);
            if (_SafeStr_6655.layerIndex == BASE_LAYER_INDEX)
            {
                _local_1.addListItem(_SafeStr_6656);
            }
            else
            {
                _local_1.addListItemAt(_SafeStr_6656, 0);
            };
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_SafeStr_6662)
                {
                    _SafeStr_6662.dispose();
                    _SafeStr_6662 = null;
                };
                if (_SafeStr_6656)
                {
                    _SafeStr_6656.dispose();
                    _SafeStr_6656 = null;
                };
                _SafeStr_6657 = null;
                _partSelectButton = null;
                _SafeStr_6658 = null;
                _SafeStr_6659 = null;
                _SafeStr_6660 = null;
                _SafeStr_4144 = null;
                _disposed = true;
            };
        }

        public function setLayerOptions(_arg_1:BadgeLayerOptions):void
        {
            if (_arg_1.layerIndex != _SafeStr_6655.layerIndex)
            {
                throw (new Error("Tried to set layer option with invalid layerIndex value"));
            };
            var _local_2:Boolean;
            var _local_3:BadgeLayerOptions = _SafeStr_6655;
            _SafeStr_6655 = _arg_1.clone();
            if (!_SafeStr_6655.isGridEqual(_local_3))
            {
                updatePositionPicker(false);
                _local_2 = true;
            };
            if (_local_3.colorIndex != _SafeStr_6655.colorIndex)
            {
                _SafeStr_6662.setSelectedColorIndex(_SafeStr_6655.colorIndex, false);
                _SafeStr_6655.colorIndex = _SafeStr_6662.selectedColorIndex;
                _local_2 = true;
            };
            if (((_local_2) || (!(_local_3.partIndex == _SafeStr_6655.partIndex))))
            {
                updateSelectedPart();
            };
        }

        public function get layerOptions():BadgeLayerOptions
        {
            return (_SafeStr_6655);
        }

        public function updateSelectedPart():void
        {
            var _local_1:* = null;
            if (_SafeStr_6570.badgeSelectPartCtrl)
            {
                _local_1 = _SafeStr_6570.badgeSelectPartCtrl.getPartItemImage(layerOptions);
            };
            if (_local_1 == null)
            {
                _local_1 = _SafeStr_6663;
            };
            _SafeStr_6657.bitmap.dispose();
            _SafeStr_6657.bitmap = new BitmapData(_local_1.width, _local_1.height);
            _SafeStr_6657.bitmap.copyPixels(_local_1, _local_1.rect, new Point());
            _SafeStr_6570.onPartChanged(this);
        }

        private function updatePositionPicker(_arg_1:Boolean=true):void
        {
            _SafeStr_6659.x = ((_SafeStr_6655.gridX * 14) + 1);
            _SafeStr_6659.y = ((_SafeStr_6655.gridY * 14) + 1);
            if (_arg_1)
            {
                updateSelectedPart();
            };
        }

        private function onPositionGridClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((!(_arg_1.type == "WME_CLICK")) || (!(_SafeStr_6659))))
            {
                return;
            };
            var _local_3:WindowMouseEvent = (_arg_1 as WindowMouseEvent);
            _SafeStr_6655.gridX = Math.min(2, Math.max(0, Math.floor((_local_3.localX / 14))));
            _SafeStr_6655.gridY = Math.min(2, Math.max(0, Math.floor((_local_3.localY / 14))));
            updatePositionPicker();
        }

        private function onPartPreviewButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _SafeStr_6570.onShowSelectPart(this);
        }

        public function onColorSelected(_arg_1:ColorGridCtrl):void
        {
            if (_SafeStr_6655.colorIndex != _arg_1.selectedColorIndex)
            {
                _SafeStr_6655.colorIndex = _arg_1.selectedColorIndex;
                updateSelectedPart();
            };
        }


    }
}//package com.sulake.habbo.groups.badge

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_6570 = "_-QJ" (String#2461, DoABC#4)
// _SafeStr_6655 = "_-5S" (String#2242, DoABC#4)
// _SafeStr_6656 = "_-8y" (String#5732, DoABC#4)
// _SafeStr_6657 = "_-f1D" (String#7911, DoABC#4)
// _SafeStr_6658 = "_-L1R" (String#11034, DoABC#4)
// _SafeStr_6659 = "_-02N" (String#7557, DoABC#4)
// _SafeStr_6660 = "_-71z" (String#9863, DoABC#4)
// _SafeStr_6661 = "_-E1g" (String#6451, DoABC#4)
// _SafeStr_6662 = "_-k1i" (String#7774, DoABC#4)
// _SafeStr_6663 = "_-oB" (String#18140, DoABC#4)


