// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.nux.NuxGiftSelectionView

package com.sulake.habbo.nux
{
    import com.sulake.habbo.session.product._SafeStr_1706;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window._SafeStr_3133;
    import __AS3__.vec.Vector;
    import _-Y12._SafeStr_1606;
    import _-IS._SafeStr_1153;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class NuxGiftSelectionView implements _SafeStr_1706 
    {

        private var _frame:_SafeStr_3263;
        private var _SafeStr_4147:HabboNuxDialogs;
        private var _SafeStr_6221:_SafeStr_3133;
        private var _SafeStr_6219:Vector.<_SafeStr_1606>;
        private var _SafeStr_6220:int;
        private var _SafeStr_6222:Vector.<_SafeStr_1153>;

        public function NuxGiftSelectionView(_arg_1:HabboNuxDialogs, _arg_2:Vector.<_SafeStr_1606>)
        {
            _SafeStr_4147 = _arg_1;
            _SafeStr_6219 = _arg_2;
            _SafeStr_6220 = 0;
            _SafeStr_6222 = new Vector.<_SafeStr_1153>();
            if (((_SafeStr_4147.sessionDataManager) && (_SafeStr_4147.sessionDataManager.loadProductData(this))))
            {
                show();
            };
        }

        public function productDataReady():void
        {
            show();
        }

        public function dispose():void
        {
            if (_frame)
            {
                _frame.dispose();
                _frame = null;
            };
            _SafeStr_4147 = null;
            _SafeStr_6221 = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4147 == null);
        }

        private function hide():void
        {
            if (_SafeStr_4147)
            {
                _SafeStr_4147.destroyNuxOfferView();
            };
        }

        private function show():void
        {
            if (_frame != null)
            {
                _frame.dispose();
            };
            var _local_2:XmlAsset = (_SafeStr_4147.assets.getAssetByName("nux_gift_selection_xml") as XmlAsset);
            _frame = (_SafeStr_4147.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3263);
            if (_frame == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
            var _local_1:_SafeStr_3109 = _frame.findChildByTag("close");
            if (_local_1)
            {
                _local_1.visible = false;
            };
            populateStep();
        }

        private function populateStep():void
        {
            var _local_6:int;
            var _local_2:* = null;
            var _local_12:* = null;
            var _local_3:* = null;
            var _local_9:* = null;
            var _local_10:* = null;
            var _local_14:* = null;
            var _local_13:* = null;
            var _local_15:int;
            var _local_4:* = null;
            var _local_16:* = null;
            var _local_8:* = null;
            var _local_11:* = null;
            var _local_17:* = null;
            if (((!(_SafeStr_6219)) || (!(_SafeStr_6219.length))))
            {
                return;
            };
            var _local_1:_SafeStr_1606 = _SafeStr_6219[_SafeStr_6220];
            var _local_5:IItemListWindow = (_frame.findChildByName("nux_gift_selection_list") as IItemListWindow);
            if (!_SafeStr_6221)
            {
                _SafeStr_6221 = (_local_5.getListItemAt(0) as _SafeStr_3133);
            };
            _local_5.removeListItems();
            var _local_7:String = decodeURI(_SafeStr_4147.localizationManager.getLocalization("nux.gift.selection.separator", ", "));
            _local_6 = 0;
            while (_local_6 < _local_1.options.length)
            {
                _local_2 = _local_1.options[_local_6];
                _local_12 = (_SafeStr_6221.clone() as _SafeStr_3133);
                _local_3 = (_local_12.getChildByName("option_heading") as ITextWindow);
                _local_9 = (_local_12.getChildByName("option_button") as _SafeStr_3122);
                _local_10 = (_local_12.getChildByName("option_thumbnail") as _SafeStr_3133);
                _local_14 = (_local_10.getChildByName("option_bitmap") as IStaticBitmapWrapperWindow);
                _local_13 = "";
                if (_local_2.productOfferList.length)
                {
                    _local_15 = 0;
                    while (_local_15 < _local_2.productOfferList.length)
                    {
                        _local_4 = _local_2.productOfferList[_local_15];
                        _local_16 = _local_4.productCode;
                        _local_8 = _local_4.localizationKey;
                        if (_local_8 != null)
                        {
                            _local_13 = (_local_13 + _SafeStr_4147.localizationManager.getLocalization(_local_8, _local_8));
                        }
                        else
                        {
                            _local_11 = _SafeStr_4147.catalog.getProductData(_local_16);
                            if (((_local_11) && (_local_11.name)))
                            {
                                _local_13 = (_local_13 + _local_11.name);
                            }
                            else
                            {
                                _local_13 = (_local_13 + _SafeStr_4147.localizationManager.getLocalization((("product_" + _local_16) + "_name"), (("product_" + _local_16) + "_name")));
                            };
                        };
                        if (_local_15 < (_local_2.productOfferList.length - 1))
                        {
                            _local_13 = (_local_13 + _local_7);
                        };
                        _local_15++;
                    };
                };
                _local_17 = _local_2.thumbnailUrl;
                if (_local_17)
                {
                    _local_14.assetUri = (_SafeStr_4147.configuration.getProperty("image.library.url") + _local_17);
                };
                _local_3.text = _local_13;
                _local_9.name = _local_6.toString();
                _local_9.procedure = onSelectOption;
                _local_5.addListItem(_local_12);
                _local_6++;
            };
            _local_5.arrangeListItems();
            if (_SafeStr_6219.length > 1)
            {
                _frame.caption = ((((_SafeStr_4147.localizationManager.getLocalization("nux.gift.selection.title") + " ") + (_SafeStr_6220 + 1)) + "/") + _SafeStr_6219.length);
            };
            _frame.center();
        }

        private function onSelectOption(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            var _local_6:* = null;
            var _local_4:int;
            var _local_5:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                _local_3 = _SafeStr_6219[_SafeStr_6220];
                _local_6 = (_frame.findChildByName("nux_gift_selection_list") as IItemListWindow);
                _local_4 = _local_6.getListItemIndex(_arg_2.parent);
                if (_local_4 == -1)
                {
                    return;
                };
                _local_5 = new _SafeStr_1153(_local_3.dayIndex, _local_3.stepIndex, _local_4);
                _SafeStr_6222.push(_local_5);
                _SafeStr_6220++;
                if (_SafeStr_6220 == _SafeStr_6219.length)
                {
                    _SafeStr_4147.onSendGetGifts(_SafeStr_6222);
                }
                else
                {
                    show();
                };
            };
        }

        private function onClose(_arg_1:WindowMouseEvent):void
        {
            hide();
        }


    }
}//package com.sulake.habbo.nux

// _SafeStr_1153 = "_-o1v" (String#12467, DoABC#4)
// _SafeStr_1606 = "_-22U" (String#14962, DoABC#4)
// _SafeStr_1673 = "_-j14" (String#36704, DoABC#4)
// _SafeStr_1686 = "_-Md" (String#39327, DoABC#4)
// _SafeStr_1706 = "_-817" (String#5080, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_6219 = "_-tI" (String#7429, DoABC#4)
// _SafeStr_6220 = "_-R1h" (String#2216, DoABC#4)
// _SafeStr_6221 = "_-32z" (String#10861, DoABC#4)
// _SafeStr_6222 = "_-r1Y" (String#14734, DoABC#4)


