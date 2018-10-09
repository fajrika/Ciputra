
<div id="dvContents" style="display: inline;">
<style type="text/css">
.lineBorder
{
	border-collapse: collapse;
	border: 1px solid black;	
}

.tableFull {
	border:1pt solid black;
}

.bordersolid{
	border:1px solid black;
}

@media print {  
  @page {
    size: 297mm 210mm; /* landscape */
    /* you can also specify margins here: */
    margin: 5mm;
  }
}

.footer {
  position: fixed;
  right: 0;
  bottom: 0;
  left: 0;
  padding: 1rem;
  text-align: left;
}
</style>
	<table width="100%">
	  <tr>
		<td>
			@include('print.logo', ['pt'=>$project->pt_user->first()->pt])
		</td>
	  </tr>
	  <tr>
		<td>
			Nama Proyek : {{ $project->name or '' }}<br>
			<table style="width: 100%; border-collapse: collapse;" border="1pt">
				<tr style="text-align: center;">
					<td>Kawasan</td>
					<td colspan="2">Budget</td>
					<td colspan="2">Kontrak</td>
					<td rowspan="2">Progress Lapangan (avg )</td>
					<td rowspan="2">Progress BAP ( avg )</td>
					<td colspan="2">BAP Terbayar</td>
					<td colspan="3">Saldo</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;Pekerjaan</td>
					<td>Budget Awal</td>
					<td>Budget Tahun</td>
					<td>Kontrak Total</td>
					<td>Kontrak Tahun</td>
					<td>Terbayar Total</td>
					<td>Terbayar Tahun</td>
					<td>Budget Awal</td>
					<td>Budget Tahun</td>
					<td>Kontrak Total</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>IDR</td>
					<td>IDR</td>
					<td>IDR</td>
					<td>IDR</td>
					<td>%</td>
					<td>%</td>
					<td>IDR</td>
					<td>IDR</td>
					<td>IDR</td>
					<td>IDR</td>
					<td>IDR</td>
				</tr>
				@foreach ( $project->kawasans as $key => $each )
				<tr>
					<td><strong>{{ $key + 1 }} {{ ucwords( $each->name ) }}</strong></td>
					<td></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>		
					<td>&nbsp;</td>		
				</tr>
				@foreach ( $each->budgets as $key2 => $each2 )
				@foreach ( $each2->details as $key3 => $each3 )
				<tr>
					<td>&nbsp;&nbsp;&nbsp;{{ $each3->itempekerjaan->name or '' }} {{ $each3->itempekerjaan->id or '' }} {{ $each3->itempekerjaan->code or '' }}</td>
					<td>{{ number_format($each3->nilai,2) }}</td>
					<td>{{ number_format($each3->itempekerjaan->budget_tahunan->first()->nilai,2) }}</td>
					<td>{{ number_format($project->nilai_kontrak($each3->itempekerjaan->id),2 ) }}</td>
					<td>{{ number_format($project->nilai_year_kontrak($each3->itempekerjaan->id,$request->year),2 ) }}</td>
					<td>{{ number_format($project->nilai_percentage($each3->itempekerjaan->id) * 100 ,2) }} %</td>
					<td>{{ number_format($project->nilai_by_year_percentage($each3->itempekerjaan->id,$request->year) * 100 ,2) }} %</td>
					<td>{{ number_format($project->nilai_bap_terbayar($each3->itempekerjaan->id),2) }}</td>
					<td>{{ number_format($project->nilai_bap_year_terbayar($each3->itempekerjaan->id,$request->year),2) }}</td>
					<td>{{ number_format($each3->nilai - $project->nilai_kontrak($each3->itempekerjaan->id, 2 ) )}}</td>
					<td>{{ number_format($each3->itempekerjaan->budget_tahunan->first()->nilai - $project->nilai_bap_year_terbayar($each3->itempekerjaan->id,$request->year), 2) }}</td>		
					<td>{{ number_format($project->nilai_kontrak($each3->itempekerjaan->id) - $project->nilai_bap_terbayar($each3->itempekerjaan->id), 2) }}</td>		
				</tr>
				@endforeach
				@endforeach
				@endforeach
				<tr>
					<td><strong>Total</strong></td>
					<td>{{ number_format($project->nilai_budget_awal,2 ) }}</td>
					<td>{{ number_format($project->nilai_budget_tahun_awal,2 ) }}</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>		
					<td>&nbsp;</td>		
				</tr>
			</table>
	  	</td>
	  </tr>
	</table><br>
	<table style="width: 100%;">
		<tr>
			<td style="width: 25%;vertical-align: top;">				
				<table style="width: 100%;border-collapse: collapse;" border="1pt">
					<tr>
						<td colspan="2"><strong>Luas Area :</strong></td>
					</tr>
					<tr>
						<td>Netto / m2</td>
						<td>{{  number_format( $project->sell_unit ) }} m2</td>
					</tr>
					<tr>
						<td>Brutto / m2</td>
						<td>{{  number_format( $project->luas ) }} m2</td>
					</tr>
					<tr>
						<td>Effisiensi / m2</td>
						<td>{{  number_format( $project->efisiensi ) }} m2</td>
					</tr>
				</table>
			</td>
			<td style="width: 75%;vertical-align: top;">
				<table style="width: 100%;border-collapse: collapse;" border="1pt">
					<tr>
						<td colspan="2">HPP/m2</td>
						<td>Kawasan (IDR)</td>
						<td>Project (IDR)</td>
						<td>Total (IDR)</td>
					</tr>
					<tr>
						<td rowspan="3" style="vertical-align: top;">Netto</td>
						<td>Budget</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Kontrak</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Realisasi</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td rowspan="3" style="vertical-align: top;">Brutto</td>
						<td>Budget</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Kontrak</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>Realisasi</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	@include("print.footer",["project" => $project ])
</div>