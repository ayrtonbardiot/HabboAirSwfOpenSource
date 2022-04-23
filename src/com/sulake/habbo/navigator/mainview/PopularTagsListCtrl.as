// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.mainview.PopularTagsListCtrl

package com.sulake.habbo.navigator.mainview
{
    import com.sulake.habbo.navigator.IViewCtrl;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.navigator.TagRenderer;
    import com.sulake.habbo.navigator.Util;
    import com.sulake.core.window.components.ITextWindow;
    import _-Ja._SafeStr_1659;
    import com.sulake.core.window.*;
    import com.sulake.core.window.components.*;
    import com.sulake.core.window.events.*;
    import com.sulake.habbo.navigator.*;
    import com.sulake.core.window.enum.*;

    public class PopularTagsListCtrl implements IViewCtrl 
    {

        private var _navigator:HabboNavigator;
        private var _content:_SafeStr_3133;
        private var _SafeStr_4162:IItemListWindow;
        private var _SafeStr_8665:int;
        private var _SafeStr_4877:TagRenderer;

        public function PopularTagsListCtrl(_arg_1:HabboNavigator):void
        {
            _navigator = _arg_1;
            _SafeStr_4877 = new TagRenderer(_navigator);
        }

        public function dispose():void
        {
            if (_SafeStr_4877)
            {
                _SafeStr_4877.dispose();
                _SafeStr_4877 = null;
            };
        }

        public function set content(_arg_1:_SafeStr_3133):void
        {
            _content = _arg_1;
            _SafeStr_4162 = ((_content) ? IItemListWindow(_content.findChildByName("item_list")) : null);
        }

        public function get content():_SafeStr_3133
        {
            return (_content);
        }

        public function refresh():void
        {
            var _local_3:int;
            var _local_1:* = null;
            _SafeStr_4877.useHashTags = true;
            var _local_4:Array = _navigator.data.popularTags.tags;
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_SafeStr_4162.getListItemAt(0));
            if (_local_2 == null)
            {
                _local_2 = _SafeStr_3133(_navigator.getXmlWindow("grs_popular_tag_row"));
                _SafeStr_4162.addListItem(_local_2);
            };
            Util.hideChildren(_local_2);
            _local_3 = 0;
            while (_local_3 < _navigator.data.popularTags.tags.length)
            {
                _local_1 = _navigator.data.popularTags.tags[_local_3];
                _SafeStr_4877.refreshTag(_local_2, _local_3, _local_1.tagName);
                _local_3++;
            };
            Util.layoutChildrenInArea(_local_2, _local_2.width, 18, 3);
            _local_2.height = Util.getLowestPoint(_local_2);
            _content.findChildByName("no_tags_found").visible = (_local_4.length < 1);
        }

        private function refreshTagName(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1659):void
        {
            var _local_3:String = "txt";
            var _local_4:ITextWindow = ITextWindow(_arg_1.findChildByName(_local_3));
            if (_arg_2 == null)
            {
                return;
            };
            _local_4.visible = true;
            _local_4.text = _arg_2.tagName;
        }


    }
}//package com.sulake.habbo.navigator.mainview

// _SafeStr_1659 = "_-bK" (String#30240, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_4877 = "_-Et" (String#2823, DoABC#4)
// _SafeStr_8665 = "_-Qq" (String#39276, DoABC#4)


