// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.groups.badge.BadgeSelectPartCtrl

package com.sulake.habbo.groups.badge
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.groups.HabboGroupsManager;
    import __AS3__.vec.Vector;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class BadgeSelectPartCtrl implements _SafeStr_13 
    {

        private var _SafeStr_4144:HabboGroupsManager;
        private var _SafeStr_6570:BadgeEditorCtrl;
        private var _SafeStr_6828:Vector.<BadgeEditorPartItem>;
        private var _SafeStr_6827:Vector.<BadgeEditorPartItem>;
        private var _SafeStr_6655:BadgeLayerOptions;
        private var _SafeStr_4859:_SafeStr_3133;
        private var _SafeStr_6829:_SafeStr_3264;
        private var _disposed:Boolean = false;

        public function BadgeSelectPartCtrl(_arg_1:HabboGroupsManager, _arg_2:BadgeEditorCtrl)
        {
            _SafeStr_4144 = _arg_1;
            _SafeStr_6570 = _arg_2;
        }

        public function get layerOptions():BadgeLayerOptions
        {
            return (_SafeStr_6655);
        }

        public function set layerOptions(_arg_1:BadgeLayerOptions):void
        {
            _SafeStr_6655 = _arg_1;
        }

        public function dispose():void
        {
            var _local_1:* = null;
            if (!_disposed)
            {
                if (((!(_SafeStr_6570.partSelectGrid == null)) && (_SafeStr_6570.partSelectGrid.numGridItems > 0)))
                {
                    _SafeStr_6570.partSelectGrid.destroyGridItems();
                };
                if (_SafeStr_6827)
                {
                    for each (_local_1 in _SafeStr_6827)
                    {
                        _local_1.dispose();
                    };
                    _SafeStr_6827 = null;
                };
                if (_SafeStr_6828)
                {
                    for each (_local_1 in _SafeStr_6828)
                    {
                        _local_1.dispose();
                    };
                    _SafeStr_6828 = null;
                };
                _SafeStr_6655 = null;
                _SafeStr_6829 = null;
                _SafeStr_4859 = null;
                _SafeStr_6570 = null;
                _SafeStr_4144 = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function getSelectedPartIndex():int
        {
            var _local_1:int = -1;
            if ((((!(_SafeStr_6655 == null)) && (!(_SafeStr_6570.partSelectGrid == null))) && (!(_SafeStr_4859 == null))))
            {
                _local_1 = _SafeStr_6570.partSelectGrid.getGridItemIndex(_SafeStr_4859);
                if (((!(_local_1 == -1)) && (!(_SafeStr_6655.layerIndex == BadgeLayerCtrl.BASE_LAYER_INDEX))))
                {
                    _local_1 = (_local_1 - 1);
                };
            };
            return (_local_1);
        }

        public function loadData():void
        {
            var _local_1:* = null;
            if (((!(_SafeStr_6827 == null)) || (!(_SafeStr_6828 == null))))
            {
                return;
            };
            _SafeStr_6827 = new Vector.<BadgeEditorPartItem>();
            for each (_local_1 in _SafeStr_4144.guildEditorData.baseParts)
            {
                _SafeStr_6827.push(new BadgeEditorPartItem(_SafeStr_4144, this, _SafeStr_6827.length, BadgeEditorPartItem.BASE_PART, _local_1));
            };
            _SafeStr_6828 = new Vector.<BadgeEditorPartItem>();
            _SafeStr_6828.push(new BadgeEditorPartItem(_SafeStr_4144, this, -1, BadgeEditorPartItem.LAYER_PART));
            for each (_local_1 in _SafeStr_4144.guildEditorData.layerParts)
            {
                _SafeStr_6828.push(new BadgeEditorPartItem(_SafeStr_4144, this, (_SafeStr_6828.length - 1), BadgeEditorPartItem.LAYER_PART, _local_1));
            };
        }

        public function updateGrid():void
        {
            var _local_1:* = null;
            _SafeStr_4859 = null;
            _SafeStr_6829 = null;
            _SafeStr_6655 = _SafeStr_6570.currentLayerOptions.clone();
            _SafeStr_6570.partSelectGrid.destroyGridItems();
            if (_SafeStr_6655.layerIndex == BadgeLayerCtrl.BASE_LAYER_INDEX)
            {
                for each (_local_1 in _SafeStr_6827)
                {
                    _SafeStr_6570.partSelectGrid.addGridItem(createGridItem(_local_1));
                };
            }
            else
            {
                for each (_local_1 in _SafeStr_6828)
                {
                    _SafeStr_6570.partSelectGrid.addGridItem(createGridItem(_local_1));
                };
            };
        }

        private function createGridItem(_arg_1:BadgeEditorPartItem):_SafeStr_3133
        {
            var _local_2:_SafeStr_3133 = (_SafeStr_4144.getXmlWindow("badge_part_item") as _SafeStr_3133);
            _local_2.procedure = onPartMouseEvent;
            setGridItemImage(_local_2, _arg_1);
            return (_local_2);
        }

        public function onBaseImageLoaded(_arg_1:BadgeEditorPartItem):void
        {
            var _local_2:* = null;
            if ((((!(_SafeStr_6655 == null)) && (_SafeStr_6655.layerIndex == BadgeLayerCtrl.BASE_LAYER_INDEX)) && (_SafeStr_6570.partSelectContainer.visible)))
            {
                _local_2 = (_SafeStr_6570.partSelectGrid.getGridItemAt(_arg_1.partIndex) as _SafeStr_3133);
                setGridItemImage(_local_2, _arg_1);
            };
        }

        public function onLayerImageLoaded(_arg_1:BadgeEditorPartItem):void
        {
            var _local_2:* = null;
            if ((((!(_SafeStr_6655 == null)) && (!(_SafeStr_6655.layerIndex == BadgeLayerCtrl.BASE_LAYER_INDEX))) && (_SafeStr_6570.partSelectContainer.visible)))
            {
                _local_2 = (_SafeStr_6570.partSelectGrid.getGridItemAt((_arg_1.partIndex + 1)) as _SafeStr_3133);
                setGridItemImage(_local_2, _arg_1);
            };
        }

        private function setGridItemImage(_arg_1:_SafeStr_3133, _arg_2:BadgeEditorPartItem):void
        {
            var _local_5:* = null;
            var _local_4:BitmapData = _arg_2.getComposite(_SafeStr_6655);
            if (_local_4 != null)
            {
                _local_5 = (_arg_1.findChildByName("part") as _SafeStr_3264);
                _local_5.bitmap = new BitmapData(_local_4.width, _local_4.height);
                _local_5.bitmap.copyPixels(_local_4, _local_4.rect, new Point());
            };
            var _local_3:_SafeStr_3264 = (_arg_1.findChildByName("selected") as _SafeStr_3264);
            _local_3.bitmap = _SafeStr_4144.getButtonImage("badge_part_picker");
            if (_arg_2.partIndex == _SafeStr_6655.partIndex)
            {
                _local_3.visible = true;
                _SafeStr_6829 = _local_3;
            }
            else
            {
                _local_3.visible = false;
            };
        }

        private function onPartMouseEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            if (_arg_1.type == "WME_OVER")
            {
                if (_SafeStr_4859 != _arg_2)
                {
                    if (_SafeStr_4859 != null)
                    {
                        _local_3 = (_SafeStr_4859.findChildByName("background") as _SafeStr_3195);
                        if (_local_3 != null)
                        {
                            _local_3.color = 15329761;
                        };
                    };
                    _SafeStr_4859 = (_arg_2 as _SafeStr_3133);
                    if (_SafeStr_4859 != null)
                    {
                        _local_3 = (_SafeStr_4859.findChildByName("background") as _SafeStr_3195);
                        if (_local_3 != null)
                        {
                            _local_3.color = 14210761;
                        };
                        _SafeStr_6655.partIndex = getSelectedPartIndex();
                        _SafeStr_6570.onPartHover(this);
                    };
                };
            };
            if (_arg_1.type == "WME_CLICK")
            {
                if (_SafeStr_6829 != null)
                {
                    _SafeStr_6829.visible = false;
                };
                _local_4 = (_arg_2 as _SafeStr_3133);
                if (_local_4 != null)
                {
                    _SafeStr_6829 = (_local_4.findChildByName("selected") as _SafeStr_3264);
                    _SafeStr_6829.visible = true;
                };
                _SafeStr_6570.onPartSelected(this);
            };
        }

        public function getPartItemImage(_arg_1:BadgeLayerOptions):BitmapData
        {
            if (((_arg_1 == null) || (_arg_1.partIndex < 0)))
            {
                return (null);
            };
            if (_arg_1.layerIndex == BadgeLayerCtrl.BASE_LAYER_INDEX)
            {
                if (((!(_SafeStr_6827 == null)) && (_arg_1.partIndex < _SafeStr_6827.length)))
                {
                    return (_SafeStr_6827[_arg_1.partIndex].getComposite(_arg_1));
                };
            }
            else
            {
                if (((!(_SafeStr_6828 == null)) && ((_arg_1.partIndex + 1) < _SafeStr_6828.length)))
                {
                    return (_SafeStr_6828[(_arg_1.partIndex + 1)].getComposite(_arg_1));
                };
            };
            return (null);
        }


    }
}//package com.sulake.habbo.groups.badge

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1578 = "_-h5" (String#24252, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_4859 = "_-JC" (String#1312, DoABC#4)
// _SafeStr_6570 = "_-QJ" (String#2461, DoABC#4)
// _SafeStr_6655 = "_-5S" (String#2242, DoABC#4)
// _SafeStr_6827 = "_-s18" (String#5410, DoABC#4)
// _SafeStr_6828 = "_-Mt" (String#5130, DoABC#4)
// _SafeStr_6829 = "_-V1q" (String#6484, DoABC#4)


