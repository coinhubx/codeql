package generatedtest;

import android.app.PendingIntent;
import androidx.core.graphics.drawable.IconCompat;
import androidx.remotecallback.RemoteCallback;
import androidx.slice.Slice;
import androidx.slice.builders.GridRowBuilder;
import androidx.slice.builders.ListBuilder;
import androidx.slice.builders.SelectionBuilder;
import androidx.slice.builders.SliceAction;

// Test case generated by GenerateFlowTestCase.ql
public class Test {

	Object source() {
		return null;
	}

	void sink(Object o) {}

	public void test() throws Exception {

		{
			// "androidx.slice.builders;ListBuilder$HeaderBuilder;false;setContentDescription;;;Argument[-1];ReturnValue;value"
			ListBuilder.HeaderBuilder out = null;
			ListBuilder.HeaderBuilder in = (ListBuilder.HeaderBuilder) source();
			out = in.setContentDescription(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$HeaderBuilder;false;setLayoutDirection;;;Argument[-1];ReturnValue;value"
			ListBuilder.HeaderBuilder out = null;
			ListBuilder.HeaderBuilder in = (ListBuilder.HeaderBuilder) source();
			out = in.setLayoutDirection(0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$HeaderBuilder;false;setPrimaryAction;;;Argument[-1];ReturnValue;value"
			ListBuilder.HeaderBuilder out = null;
			ListBuilder.HeaderBuilder in = (ListBuilder.HeaderBuilder) source();
			out = in.setPrimaryAction(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$HeaderBuilder;false;setPrimaryAction;;;Argument[0];Argument[-1];taint"
			ListBuilder.HeaderBuilder out = null;
			SliceAction in = (SliceAction) source();
			out.setPrimaryAction(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$HeaderBuilder;false;setSubtitle;;;Argument[-1];ReturnValue;value"
			ListBuilder.HeaderBuilder out = null;
			ListBuilder.HeaderBuilder in = (ListBuilder.HeaderBuilder) source();
			out = in.setSubtitle(null, false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$HeaderBuilder;false;setSubtitle;;;Argument[-1];ReturnValue;value"
			ListBuilder.HeaderBuilder out = null;
			ListBuilder.HeaderBuilder in = (ListBuilder.HeaderBuilder) source();
			out = in.setSubtitle(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$HeaderBuilder;false;setSummary;;;Argument[-1];ReturnValue;value"
			ListBuilder.HeaderBuilder out = null;
			ListBuilder.HeaderBuilder in = (ListBuilder.HeaderBuilder) source();
			out = in.setSummary(null, false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$HeaderBuilder;false;setSummary;;;Argument[-1];ReturnValue;value"
			ListBuilder.HeaderBuilder out = null;
			ListBuilder.HeaderBuilder in = (ListBuilder.HeaderBuilder) source();
			out = in.setSummary(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$HeaderBuilder;false;setTitle;;;Argument[-1];ReturnValue;value"
			ListBuilder.HeaderBuilder out = null;
			ListBuilder.HeaderBuilder in = (ListBuilder.HeaderBuilder) source();
			out = in.setTitle(null, false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$HeaderBuilder;false;setTitle;;;Argument[-1];ReturnValue;value"
			ListBuilder.HeaderBuilder out = null;
			ListBuilder.HeaderBuilder in = (ListBuilder.HeaderBuilder) source();
			out = in.setTitle(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;addEndItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.addEndItem(null, false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;addEndItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.addEndItem(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;addEndItem;;;Argument[0];Argument[-1];taint"
			ListBuilder.InputRangeBuilder out = null;
			SliceAction in = (SliceAction) source();
			out.addEndItem(in, false);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;addEndItem;;;Argument[0];Argument[-1];taint"
			ListBuilder.InputRangeBuilder out = null;
			SliceAction in = (SliceAction) source();
			out.addEndItem(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setContentDescription;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.setContentDescription(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setInputAction;(PendingIntent);;Argument[0];Argument[-1];taint"
			ListBuilder.InputRangeBuilder out = null;
			PendingIntent in = (PendingIntent) source();
			out.setInputAction(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setInputAction;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.setInputAction((RemoteCallback) null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setInputAction;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.setInputAction((PendingIntent) null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setLayoutDirection;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.setLayoutDirection(0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setMax;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.setMax(0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setMin;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.setMin(0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setPrimaryAction;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.setPrimaryAction(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setPrimaryAction;;;Argument[0];Argument[-1];taint"
			ListBuilder.InputRangeBuilder out = null;
			SliceAction in = (SliceAction) source();
			out.setPrimaryAction(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setSubtitle;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.setSubtitle(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setThumb;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.setThumb(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setTitle;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.setTitle(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setTitleItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.setTitleItem(null, 0, false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setTitleItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.setTitleItem(null, 0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$InputRangeBuilder;false;setValue;;;Argument[-1];ReturnValue;value"
			ListBuilder.InputRangeBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out = in.setValue(0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RangeBuilder;false;setContentDescription;;;Argument[-1];ReturnValue;value"
			ListBuilder.RangeBuilder out = null;
			ListBuilder.RangeBuilder in = (ListBuilder.RangeBuilder) source();
			out = in.setContentDescription(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RangeBuilder;false;setMax;;;Argument[-1];ReturnValue;value"
			ListBuilder.RangeBuilder out = null;
			ListBuilder.RangeBuilder in = (ListBuilder.RangeBuilder) source();
			out = in.setMax(0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RangeBuilder;false;setMode;;;Argument[-1];ReturnValue;value"
			ListBuilder.RangeBuilder out = null;
			ListBuilder.RangeBuilder in = (ListBuilder.RangeBuilder) source();
			out = in.setMode(0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RangeBuilder;false;setPrimaryAction;;;Argument[-1];ReturnValue;value"
			ListBuilder.RangeBuilder out = null;
			ListBuilder.RangeBuilder in = (ListBuilder.RangeBuilder) source();
			out = in.setPrimaryAction(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RangeBuilder;false;setPrimaryAction;;;Argument[0];Argument[-1];taint"
			ListBuilder.RangeBuilder out = null;
			SliceAction in = (SliceAction) source();
			out.setPrimaryAction(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RangeBuilder;false;setSubtitle;;;Argument[-1];ReturnValue;value"
			ListBuilder.RangeBuilder out = null;
			ListBuilder.RangeBuilder in = (ListBuilder.RangeBuilder) source();
			out = in.setSubtitle(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RangeBuilder;false;setTitle;;;Argument[-1];ReturnValue;value"
			ListBuilder.RangeBuilder out = null;
			ListBuilder.RangeBuilder in = (ListBuilder.RangeBuilder) source();
			out = in.setTitle(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RangeBuilder;false;setTitleItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.RangeBuilder out = null;
			ListBuilder.RangeBuilder in = (ListBuilder.RangeBuilder) source();
			out = in.setTitleItem(null, 0, false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RangeBuilder;false;setTitleItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.RangeBuilder out = null;
			ListBuilder.RangeBuilder in = (ListBuilder.RangeBuilder) source();
			out = in.setTitleItem(null, 0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RangeBuilder;false;setValue;;;Argument[-1];ReturnValue;value"
			ListBuilder.RangeBuilder out = null;
			ListBuilder.RangeBuilder in = (ListBuilder.RangeBuilder) source();
			out = in.setValue(0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RatingBuilder;false;setContentDescription;;;Argument[-1];ReturnValue;value"
			ListBuilder.RatingBuilder out = null;
			ListBuilder.RatingBuilder in = (ListBuilder.RatingBuilder) source();
			out = in.setContentDescription(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RatingBuilder;false;setInputAction;(PendingIntent);;Argument[0];Argument[-1];taint"
			ListBuilder.RatingBuilder out = null;
			PendingIntent in = (PendingIntent) source();
			out.setInputAction(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RatingBuilder;false;setInputAction;;;Argument[-1];ReturnValue;value"
			ListBuilder.RatingBuilder out = null;
			ListBuilder.RatingBuilder in = (ListBuilder.RatingBuilder) source();
			out = in.setInputAction((RemoteCallback) null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RatingBuilder;false;setInputAction;;;Argument[-1];ReturnValue;value"
			ListBuilder.RatingBuilder out = null;
			ListBuilder.RatingBuilder in = (ListBuilder.RatingBuilder) source();
			out = in.setInputAction((PendingIntent) null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RatingBuilder;false;setMax;;;Argument[-1];ReturnValue;value"
			ListBuilder.RatingBuilder out = null;
			ListBuilder.RatingBuilder in = (ListBuilder.RatingBuilder) source();
			out = in.setMax(0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RatingBuilder;false;setMin;;;Argument[-1];ReturnValue;value"
			ListBuilder.RatingBuilder out = null;
			ListBuilder.RatingBuilder in = (ListBuilder.RatingBuilder) source();
			out = in.setMin(0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RatingBuilder;false;setPrimaryAction;;;Argument[-1];ReturnValue;value"
			ListBuilder.RatingBuilder out = null;
			ListBuilder.RatingBuilder in = (ListBuilder.RatingBuilder) source();
			out = in.setPrimaryAction(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RatingBuilder;false;setPrimaryAction;;;Argument[0];Argument[-1];taint"
			ListBuilder.RatingBuilder out = null;
			SliceAction in = (SliceAction) source();
			out.setPrimaryAction(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RatingBuilder;false;setSubtitle;;;Argument[-1];ReturnValue;value"
			ListBuilder.RatingBuilder out = null;
			ListBuilder.RatingBuilder in = (ListBuilder.RatingBuilder) source();
			out = in.setSubtitle(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RatingBuilder;false;setTitle;;;Argument[-1];ReturnValue;value"
			ListBuilder.RatingBuilder out = null;
			ListBuilder.RatingBuilder in = (ListBuilder.RatingBuilder) source();
			out = in.setTitle(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RatingBuilder;false;setTitleItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.RatingBuilder out = null;
			ListBuilder.RatingBuilder in = (ListBuilder.RatingBuilder) source();
			out = in.setTitleItem(null, 0, false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RatingBuilder;false;setTitleItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.RatingBuilder out = null;
			ListBuilder.RatingBuilder in = (ListBuilder.RatingBuilder) source();
			out = in.setTitleItem(null, 0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RatingBuilder;false;setValue;;;Argument[-1];ReturnValue;value"
			ListBuilder.RatingBuilder out = null;
			ListBuilder.RatingBuilder in = (ListBuilder.RatingBuilder) source();
			out = in.setValue(0.0f);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;addEndItem;(SliceAction);;Argument[0];Argument[-1];taint"
			ListBuilder.RowBuilder out = null;
			SliceAction in = (SliceAction) source();
			out.addEndItem(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;addEndItem;(SliceAction,boolean);;Argument[0];Argument[-1];taint"
			ListBuilder.RowBuilder out = null;
			SliceAction in = (SliceAction) source();
			out.addEndItem(in, false);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;addEndItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.addEndItem(null, 0, false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;addEndItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.addEndItem(0L);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;addEndItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.addEndItem((SliceAction) null, false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;addEndItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.addEndItem((SliceAction) null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;addEndItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.addEndItem((IconCompat) null, 0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setContentDescription;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.setContentDescription(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setEndOfSection;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.setEndOfSection(false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setLayoutDirection;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.setLayoutDirection(0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setPrimaryAction;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.setPrimaryAction(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setPrimaryAction;;;Argument[0];Argument[-1];taint"
			ListBuilder.RowBuilder out = null;
			SliceAction in = (SliceAction) source();
			out.setPrimaryAction(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setSubtitle;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.setSubtitle(null, false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setSubtitle;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.setSubtitle(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setTitle;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.setTitle(null, false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setTitle;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.setTitle(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setTitleItem;(SliceAction);;Argument[0];Argument[-1];taint"
			ListBuilder.RowBuilder out = null;
			SliceAction in = (SliceAction) source();
			out.setTitleItem(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setTitleItem;(SliceAction,boolean);;Argument[0];Argument[-1];taint"
			ListBuilder.RowBuilder out = null;
			SliceAction in = (SliceAction) source();
			out.setTitleItem(in, false);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setTitleItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.setTitleItem(null, 0, false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setTitleItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.setTitleItem(0L);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setTitleItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.setTitleItem((SliceAction) null, false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setTitleItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.setTitleItem((SliceAction) null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder$RowBuilder;false;setTitleItem;;;Argument[-1];ReturnValue;value"
			ListBuilder.RowBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out = in.setTitleItem((IconCompat) null, 0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;addAction;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.addAction(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;addAction;;;Argument[0];Argument[-1];taint"
			ListBuilder out = null;
			SliceAction in = (SliceAction) source();
			out.addAction(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;addGridRow;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.addGridRow(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;addGridRow;;;Argument[0];Argument[-1];taint"
			ListBuilder out = null;
			GridRowBuilder in = (GridRowBuilder) source();
			out.addGridRow(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;addInputRange;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.addInputRange(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;addInputRange;;;Argument[0];Argument[-1];taint"
			ListBuilder out = null;
			ListBuilder.InputRangeBuilder in = (ListBuilder.InputRangeBuilder) source();
			out.addInputRange(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;addRange;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.addRange(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;addRange;;;Argument[0];Argument[-1];taint"
			ListBuilder out = null;
			ListBuilder.RangeBuilder in = (ListBuilder.RangeBuilder) source();
			out.addRange(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;addRating;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.addRating(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;addRating;;;Argument[0];Argument[-1];taint"
			ListBuilder out = null;
			ListBuilder.RatingBuilder in = (ListBuilder.RatingBuilder) source();
			out.addRating(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;addRow;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.addRow(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;addRow;;;Argument[0];Argument[-1];taint"
			ListBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out.addRow(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;addSelection;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.addSelection(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;addSelection;;;Argument[0];Argument[-1];taint"
			ListBuilder out = null;
			SelectionBuilder in = (SelectionBuilder) source();
			out.addSelection(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;build;;;Argument[-1];ReturnValue;taint"
			Slice out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.build();
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;setAccentColor;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.setAccentColor(0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;setHeader;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.setHeader(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;setHeader;;;Argument[0];Argument[-1];taint"
			ListBuilder out = null;
			ListBuilder.HeaderBuilder in = (ListBuilder.HeaderBuilder) source();
			out.setHeader(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;setHostExtras;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.setHostExtras(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;setIsError;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.setIsError(false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;setKeywords;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.setKeywords(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;setLayoutDirection;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.setLayoutDirection(0);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;setSeeMoreAction;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.setSeeMoreAction((RemoteCallback) null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;setSeeMoreAction;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.setSeeMoreAction((PendingIntent) null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;setSeeMoreAction;;;Argument[0];Argument[-1];taint"
			ListBuilder out = null;
			RemoteCallback in = (RemoteCallback) source();
			out.setSeeMoreAction(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;setSeeMoreAction;;;Argument[0];Argument[-1];taint"
			ListBuilder out = null;
			PendingIntent in = (PendingIntent) source();
			out.setSeeMoreAction(in);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;setSeeMoreRow;;;Argument[-1];ReturnValue;value"
			ListBuilder out = null;
			ListBuilder in = (ListBuilder) source();
			out = in.setSeeMoreRow(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;ListBuilder;false;setSeeMoreRow;;;Argument[0];Argument[-1];value"
			ListBuilder out = null;
			ListBuilder.RowBuilder in = (ListBuilder.RowBuilder) source();
			out.setSeeMoreRow(in);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;SliceAction;false;create;(PendingIntent,IconCompat,int,CharSequence);;Argument[0];ReturnValue;taint"
			SliceAction out = null;
			PendingIntent in = (PendingIntent) source();
			out = SliceAction.create(in, (IconCompat) null, 0, (CharSequence) null);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;SliceAction;false;createDeeplink;(PendingIntent,IconCompat,int,CharSequence);;Argument[0];ReturnValue;taint"
			SliceAction out = null;
			PendingIntent in = (PendingIntent) source();
			out = SliceAction.createDeeplink(in, (IconCompat) null, 0, (CharSequence) null);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;SliceAction;false;createToggle;(PendingIntent,CharSequence,boolean);;Argument[0];ReturnValue;taint"
			SliceAction out = null;
			PendingIntent in = (PendingIntent) source();
			out = SliceAction.createToggle(in, (CharSequence) null, false);
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;SliceAction;false;getAction;;;Argument[-1];ReturnValue;taint"
			PendingIntent out = null;
			SliceAction in = (SliceAction) source();
			out = in.getAction();
			sink(out); // $ hasTaintFlow
		}
		{
			// "androidx.slice.builders;SliceAction;false;setChecked;;;Argument[-1];ReturnValue;value"
			SliceAction out = null;
			SliceAction in = (SliceAction) source();
			out = in.setChecked(false);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;SliceAction;false;setContentDescription;;;Argument[-1];ReturnValue;value"
			SliceAction out = null;
			SliceAction in = (SliceAction) source();
			out = in.setContentDescription(null);
			sink(out); // $ hasValueFlow
		}
		{
			// "androidx.slice.builders;SliceAction;false;setPriority;;;Argument[-1];ReturnValue;value"
			SliceAction out = null;
			SliceAction in = (SliceAction) source();
			out = in.setPriority(0);
			sink(out); // $ hasValueFlow
		}

	}

}
