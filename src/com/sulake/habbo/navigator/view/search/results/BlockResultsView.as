// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.view.search.results.BlockResultsView

package com.sulake.habbo.navigator.view.search.results
{
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.utils.Dictionary;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-21f._SafeStr_1547;
    import _-21f._SafeStr_1663;
    import com.sulake.core.window._SafeStr_3109;

    public class BlockResultsView 
    {

        private var _navigator:HabboNewNavigator;
        private var _itemList:IItemListWindow;
        private var _SafeStr_4471:CategoryElementFactory;
        private var _SafeStr_5444:Dictionary = new Dictionary();
        private var _SafeStr_5443:Dictionary = new Dictionary();
        private var _SafeStr_5445:Dictionary = new Dictionary();

        public function BlockResultsView(_arg_1:HabboNewNavigator)
        {
            _navigator = _arg_1;
        }

        public function get itemList():IItemListWindow
        {
            return (_itemList);
        }

        public function set itemList(_arg_1:IItemListWindow):void
        {
            _itemList = _arg_1;
            _itemList.disableAutodrag = true;
        }

        public function set categoryElementFactory(_arg_1:CategoryElementFactory):void
        {
            _SafeStr_4471 = _arg_1;
        }

        public function displayCurrentResults():void
        {
            var _local_1:* = null;
            var _local_4:* = null;
            var _local_2:int;
            var _local_3:* = null;
            if (_navigator.currentResults == null)
            {
                return;
            };
            _SafeStr_5443 = new Dictionary();
            _SafeStr_5444 = new Dictionary();
            _SafeStr_5445 = new Dictionary();
            _itemList.destroyListItems();
            if (_navigator.currentResults.resultSet.blocks.length == 0)
            {
                _itemList.addListItem(_SafeStr_4471.getNoResultsELement());
            }
            else
            {
                _local_4 = _navigator.currentResults.resultSet;
                _local_2 = 0;
                while (_local_2 < _local_4.blocks.length)
                {
                    _local_3 = _local_4.blocks[_local_2];
                    _local_1 = renderCurrentResultsBlock(_local_2, (((!(isMinimized(_local_3.searchCode))) || (isSingleBlock(_local_4))) && (!(_local_3.forceClosed))));
                    _local_1.id = _local_2;
                    _itemList.addListItem(_local_1);
                    _SafeStr_5443[_local_2] = _local_1;
                    _SafeStr_5444[_local_2] = _local_3.searchCode;
                    _SafeStr_5445[_local_2] = _local_3.viewMode;
                    _local_2++;
                };
            };
            _itemList.arrangeListItems();
        }

        public function onCategoryShowMoreClicked(_arg_1:_SafeStr_3116):void
        {
            _navigator.performSearch(_SafeStr_5444[_arg_1.window.id], _navigator.currentResults.filteringData);
            _navigator.trackEventLog("browse.expandsearch", "Results", HabboNewNavigator.getEventLogExtraStringFromSearch(_SafeStr_5444[_arg_1.window.id], _navigator.currentResults.filteringData));
        }

        public function onCategoryBackClicked(_arg_1:_SafeStr_3116):void
        {
            _navigator.goBack();
        }

        public function onCategoryCollapseClicked(_arg_1:_SafeStr_3116):void
        {
            _navigator.sendAddCollapsedCategory(_SafeStr_5444[_arg_1.window.id]);
            _navigator.collapsedCategories.push(_SafeStr_5444[_arg_1.window.id]);
            replaceBlock(_arg_1.window.id, false);
            _navigator.trackEventLog("browse.collapsecategory", "Results", HabboNewNavigator.getEventLogExtraStringFromSearch(_SafeStr_5444[_arg_1.window.id], _navigator.currentResults.filteringData));
        }

        public function onCategoryExpandClicked(_arg_1:_SafeStr_3116):void
        {
            _navigator.sendRemoveCollapsedCategory(_SafeStr_5444[_arg_1.window.id]);
            _navigator.collapsedCategories.splice(_navigator.collapsedCategories.indexOf(_SafeStr_5444[_arg_1.window.id]), 1);
            replaceBlock(_arg_1.window.id, true);
            _navigator.trackEventLog("browse.uncollapsecategory", "Results", HabboNewNavigator.getEventLogExtraStringFromSearch(_SafeStr_5444[_arg_1.window.id], _navigator.currentResults.filteringData));
        }

        public function onCategoryAddQuickLinkClicked(_arg_1:_SafeStr_3116):void
        {
            _navigator.addSavedSearch(_SafeStr_5444[_arg_1.window.id], _navigator.currentResults.filteringData);
        }

        public function onCategoryToggleModeClicked(_arg_1:_SafeStr_3116):void
        {
            var _local_2:int = getToggledViewMode(_SafeStr_5445[_arg_1.window.id]);
            _navigator.toggleSearchCodeViewMode(_SafeStr_5444[_arg_1.window.id], _local_2);
            _navigator.currentResults.resultSet.blocks[_arg_1.window.id].viewMode = _local_2;
            replaceBlock(_arg_1.window.id, true);
            _SafeStr_5445[_arg_1.window.id] = _local_2;
        }

        private function getToggledViewMode(_arg_1:int):int
        {
            if (_arg_1 == 0)
            {
                return (1);
            };
            return (0);
        }

        public function get itemListWidth():int
        {
            return (_itemList.width);
        }

        private function isMinimized(_arg_1:String):Boolean
        {
            return (!(_navigator.collapsedCategories.indexOf(_arg_1) == -1));
        }

        private function isSingleBlock(_arg_1:_SafeStr_1547):Boolean
        {
            return (_arg_1.blocks.length == 1);
        }

        private function renderCurrentResultsBlock(_arg_1:int, _arg_2:Boolean):_SafeStr_3109
        {
            var _local_5:int;
            var _local_3:_SafeStr_1663 = _navigator.currentResults.resultSet.blocks[_arg_1];
            var _local_4:String = ((_local_3.text == "") ? (("${navigator.searchcode.title." + _local_3.searchCode) + "}") : _local_3.text);
            if (_arg_2)
            {
                _local_5 = (((!(_navigator.sessionData.isPerkAllowed("NAVIGATOR_ROOM_THUMBNAIL_CAMERA"))) && (!(_navigator.currentResults.searchCodeOriginal == "official_view"))) ? 0 : _local_3.viewMode);
                return (_SafeStr_4471.getOpenCategoryElement(_local_3.guestRooms, _local_4, _arg_1, _local_3.actionAllowed, _local_5));
            };
            return (_SafeStr_4471.getCollapsedCategoryElement(_local_4, _arg_1, _local_3.actionAllowed));
        }

        private function replaceBlock(_arg_1:int, _arg_2:Boolean):void
        {
            var _local_4:int = _itemList.getListItemIndex(_SafeStr_5443[_arg_1]);
            _itemList.removeListItemAt(_local_4);
            var _local_3:_SafeStr_3109 = renderCurrentResultsBlock(_arg_1, _arg_2);
            _local_3.id = _arg_1;
            _itemList.addListItemAt(_local_3, _local_4);
            _SafeStr_5443[_arg_1] = _local_3;
        }


    }
}//package com.sulake.habbo.navigator.view.search.results

// _SafeStr_1547 = "_-E1O" (String#12956, DoABC#4)
// _SafeStr_1663 = "_-l1U" (String#23689, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_4471 = "_-P1b" (String#4925, DoABC#4)
// _SafeStr_5443 = "_-i1b" (String#9258, DoABC#4)
// _SafeStr_5444 = "_-f1S" (String#4866, DoABC#4)
// _SafeStr_5445 = "_-21q" (String#8767, DoABC#4)


