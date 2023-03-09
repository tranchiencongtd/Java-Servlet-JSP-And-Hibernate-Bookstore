	<table class="form-group">
			<tr>
				<td align="right">E-mail:</td>
				<td align="left"><input type="text" class="form-control" id="email" name="email" size="45" value="${customer.email}"/></td>
			</tr>
			<tr>
				<td align="right">Họ và tên:</td>
				<td align="left"><input type="text" id="fullName" name="fullName" size="45" value="${customer.fullname}" class="form-control"/></td>
			</tr>
			<tr>
				<td align="right">Mật khẩu:</td>
				<td align="left"><input type="password" id="password" name="password" size="45" value="${customer.password}" class="form-control"/></td>
			</tr>
			<tr>
				<td align="right">Nhập lại mật khẩu:</td>
				<td align="left"><input type="password" id="confirmpassword" name="confirmpassword" size="45" value="${customer.password}" class="form-control"/></td>
			</tr>
			<tr>
				<td align="right">Số điện thoại:</td>
				<td align="left"><input type="text" id="phone" name="phone" size="45" value="${customer.phone}" class="form-control"/></td>
			</tr>
			<tr>
				<td align="right">Thành phố:</td>
				<td align="left"><input type="text" id="city" name="city" size="45" value="${customer.city}" class="form-control"/></td>
			</tr>
			<tr>
				<td align="right">Zip code:</td>
				<td align="left"><input type="text" id="zipCode" name="zipCode" size="45" value="${customer.zipcode}" class="form-control"/></td>
			</tr>
			<tr>
				<td align="right">Đất nước:</td>
				<td align="left">
				    <select name="country" id="country" class="form-control">
				    <c:forEach items="${mapCountries}" var="country">
				       <option value="${country.value}"<c:if test="${customer.country eq country.value}">selected='selected'</c:if>>${country.key}</option>
				    </c:forEach>
				    </select>
				</td>
			</tr>
				<tr>
				<td align="right">Địa chỉ:</td>
				<td align="left"><textarea id="address" name="address" class="form-control">${customer.address}</textarea></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
		
		</table>